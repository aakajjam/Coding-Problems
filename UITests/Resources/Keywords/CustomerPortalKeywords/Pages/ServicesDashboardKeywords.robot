*** Settings ***

Documentation    Services Dashboard Page Keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../../Utils/Helpers.robot
Resource         ../../Utils/FeatureFlags.robot

*** Variables ***

${SERVICES_PAGE_TITLE} =               xpath = //*[text()='Services']
${ALERT_CLOSE_BUTTON} =                xpath = //*[contains(text(),'You are using the new SkySQL release. Existing customers, ')]//..//..//button[not(disabled)]
${LAUNCH_A_CLOUD_DATABASE_BUTTON} =    xpath = //*[@data-auto='launch-service-btn']|//*[contains(text(), 'Launch a cloud database')]
${DASHBAORD_LAUNCH_BUTTON} =           css = .launch-btn
${PLUS_BUTTON} =                       xpath = //*[contains(text(),'Services')]//..//span[@class='v-btn__content']
${SERVICE_LAUNCH_IN_PROGRESS_LABEL} =  xpath = //*[contains(text(),'{}')]//..//..//..//*[contains(text(),'Service launch in process')]
${SERVICE_LAUNCH_STATUS_HEALTHY} =     xpath = //*[contains(text(),'{}')]//..//..//..//*[contains(text(),'Your new service is up and running.')]
${SERVICE_STATUS_LABEL}                xpath = //*[contains(text(),'{}')]//..//*[@id='serviceStatusStrip']//*[@class='mr-2 letter-spacing-none']
${SERVICE_TOPOLOGY_TYPE_LABEL}         xpath = //*[contains(text(),'{}')]//..//*[@id='serviceStatusStrip']//*[@class='mr-2'][1]
${SERVICE_REGION_LABEL}                xpath = //*[contains(text(),'{}')]//..//*[@id='serviceStatusStrip']//*[@class='mr-2'][2]
#${CONNECT_BUTTON} =                    xpath = //*[contains(text(),'{}')]//..//..//..//*[contains(text(),'Connect')][not(disabled)]
${CONNECT_BUTTON} =                    css = .btn-service-action-connect
${CONNECT_BUTTON_DISABLED} =           xpath = //*[contains(text(),'{}')]//..//..//..//*[contains(.,'Connect') and contains(@disabled, 'disabled')]
#${MANAGE_BUTTON} =                     xpath = //*[contains(text(),'{}')]//..//..//*[contains(text(),'Manage')][not(disabled)]
${MANAGE_BUTTON}                       css = .btn-service-action-manage
#${SETUP_MANAGE_ALLOWLIST_LABEL} =      xpath = //*[contains(text(), 'Set up allowlist') or contains(text(), 'Manage allowlist')]
${SETUP_MANAGE_ALLOWLIST_LABEL}        css = div[data-test-id=btn-manage-security-access]
${STOP_SERVICE_BUTTON} =               xpath = //*[contains(text(), 'Stop service')]
${START_SERVICE_BUTTON} =              xpath = //*[contains(text(), 'Start service')]
${XPAND_REPLICATION_BUTTON} =          xpath = //*[contains(text(), 'Xpand Global Replication')]
${SCALE_STORAGE_SERVICE_LABEL} =       xpath = //*[contains(text(), 'Scale storage')]
${SCALE_NODES_INOUT_SERVICE_LABEL} =   xpath = //*[contains(text(), 'Scale nodes In/Out')]
${SCALE_NODES_UPDOWN_SERVICE_LABEL} =  xpath = //*[contains(text(), 'Scale nodes up/down')]
${SET_UP_MANAGE_PSC_PL_LABEL} =        xpath = //*[contains(text(), 'AWS PrivateLink') or contains(text(), 'Google Private Service Connect')]
${XPAND_REPLICATION_SERVICE_LABEL} =   xpath = //*[@data-auto='service-menu-list-{}']//*[contains(text(), 'Xpand Global Replication')]
${DELETE_SERVICE_LABEL} =              xpath = //*[@data-auto='service-menu-list-{}']//*[contains(text(),'Delete service')]
${APPLY_DB_CONFIG_LABEL}               xpath = //*[contains(text(), 'Apply database configuration')]
${SERVICE_CARD_TITLE}                  xpath = //*[contains(@class, 'd-flex')]//*[contains(text(),'{}')]
${SERVICE_REPLICATION_STATUS_ACTIVE}   xpath = //*[contains(text(),'{}')]//..//..//..//..//*[contains(text(), 'active')]
${LAUNCHING_STATUS}                    xpath = //*[contains(text(),'{}')]//..//..//..//*[contains(text(), 'Creating')]    
#${LAUNCHING_STATUS}                    css=.py-6
${GET_STARTED_BUTTON} =                css=.btn-service-action-get-started

*** Keywords ***

Verify page title is 'Services'
    [Documentation]    Check the page title is 'Services'

    TRY
        wait until element is visible    ${SERVICES_PAGE_TITLE}    30s    error = 'Services' page title is not displayed!

        ${services_actual_title_text} =  get text    ${SERVICES_PAGE_TITLE}

        # ${SERVICES_PAGE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
        should be equal as strings    ${services_actual_title_text}    ${SERVICES_PAGE_EXPECTED_TITLE}

        log to console    Verify page title is 'Services'
    EXCEPT    
        wait until element is visible    ${DASHBAORD_LAUNCH_BUTTON}    30s    error = 'Launch a cloud database' button is not displayed on the 'Services' page!
    END    

Click on 'Launch a cloud database' button
    [Documentation]    Click on 'Launch a cloud database' button

    TRY
        wait until element is visible    ${DASHBAORD_LAUNCH_BUTTON}    10s
        click element    ${DASHBAORD_LAUNCH_BUTTON}
        log to console    "Launch New Service" button clicked!
    EXCEPT
        log to console    "+" button is not displayed
    END

    # wait until element is visible    ${LAUNCH_A_CLOUD_DATABASE_BUTTON}    6s     error = 'Launch a cloud database button' is not displayed on the 'Services' page!
    # click element  ${LAUNCH_A_CLOUD_DATABASE_BUTTON}

    log to console    Click on 'Launch New Service' button END

Wait for status 'Healthy'
    [Documentation]    Wait until the topology status becomes 'Healthy'

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed!
    ${service_status_label_text} =    get text    ${formatted_service_status_label}

    

    WHILE    '${service_status_label_text}' != '${SERVICE_STATE_FAILED}'    limit= 120
        sleep  30 sec
        wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed on 'Service' page!
        ${service_status_label_text} =    get text    ${formatted_service_status_label}
        IF    '${service_status_label_text}' == '${SERVICE_STATE_HEALTHY}'
            BREAK
        END
        IF    '${service_status_label_text}' == '${SERVICE_STATE_WARNING}' or '${service_status_label_text}' == '${SERVICE_STATE_UNHEALTHY}'
            capture page screenshot
            fatal error    The topology being launched returns status WARNING/UNHEALTHY
            BREAK
        END
    END

    IF    '${service_status_label_text}' == '${SERVICE_STATE_FAILED}'
        capture page screenshot
        fatal error    The topology being launched returns status FAILED
    END

    IF    '${service_status_label_text}' != '${SERVICE_STATE_HEALTHY}'
        capture page screenshot
        log to console    The topology being launched returns status ${service_status_label_text}.
    END

    log to console    Wait for status 'Healthy'

    Helpers.Calculate DB time for launching

Wait for status 'Creating'
    [Documentation]    Wait until the topology status becomes 'Creating' - Doing thi because it takes a service with provisioned stats 15-30 minutes to show healthy

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed!
    ${service_status_label_text} =    get text    ${formatted_service_status_label}

    IF    '${service_status_label_text}' == '${SERVICE_STATE_CREATING}' 
        capture page screenshot
        log to console    The topology being launched returns status ${service_status_label_text} !
    END

    

    #Wait Until Page Contains Element    ${LAUNCHING_STATUS}    60 sec    error = 'Creating' status is not displayed on 'Services' page!
    #Sleep    30s
    #${creating_database_text} =    Get Text    ${LAUNCHING_STATUS}
    #Wait Until Element Is Visible    ${creating_database_text}    20s

    #Log To Console    ${creating_database_text}

Wait for status 'Stopped'
    [Documentation]    Wait until the topology status becomes 'Stopped'

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed!

    wait until element contains    ${formatted_service_status_label}    ${SERVICE_STATE_STOPPED}    5 min    error = 'State' of the service is not 'Stopped'!

    log to console    Wait for status 'Stopped'

Wait for status 'Modifying'
    [Documentation]    Wait until the topology status becomes 'Modifying'

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed!

    wait until element contains    ${formatted_service_status_label}    ${SERVICE_STATE_MODIFYING}    10 min    error = 'State' of the service is not 'Modifying'!

    log to console    Wait for status 'Modifying'

Wait for status 'Scaling'
    [Documentation]    Wait until the topology status becomes 'Scaling'

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = 'State' of the service is not displayed!

    wait until element contains    ${formatted_service_status_label}    ${SERVICE_STATE_SCALING}    5 min    error = 'State' of the service is not 'Scaling'!

    log to console    Wait for status 'Scaling'

Validate service's topology type is correctly displayed on 'Services' page
    [Documentation]    Validate topology type is correclty displayed on 'Services' page

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_topology_type_label} =    format string    ${SERVICE_TOPOLOGY_TYPE_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_service_topology_type_label}    15 sec    error = Topology's type is not displayed on 'Services' page!
    ${formatted_service_topology_type_label_actual} =    get text    ${formatted_service_topology_type_label}

    # ${TOPOLOGY_SHORT_NAME} is passed from "LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}"
    IF    '${TOPOLOGY_SHORT_NAME}' == 'Serverless Analytics'
        should be equal as strings    ${formatted_service_topology_type_label_actual}[:-13]    ${TOPOLOGY_SHORT_NAME}    msg = Service topology type label is not equal to the topology short name!
    ELSE
        should be equal as strings    ${formatted_service_topology_type_label_actual}    ${TOPOLOGY_SHORT_NAME}    msg = Service topology type label is not equal to the topology short name!
    END

    log to console    Validate service's topology type is correctly displayed  on 'Services' page

Validate single zone is displayed on the service's card
    [Documentation]    Validate service's topology type is correctly displayed on 'Services' page
    [Arguments]    ${REGION}

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_service_topology_region_label} =    format string    ${SERVICE_REGION_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_service_topology_region_label}    15 sec    error = Topology's region label is not displayed on 'Services' page!
    element should contain    ${formatted_service_topology_region_label}    ${REGION} ${SINGLE_ZONE_LABEL}

    log to console    Validate single zone is displayed on the service's card

Click on service card title
    [Documentation]    Click on the service card title

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.Input 'service name'
    ${formatted_locator_service_card_title} =  Format String  ${SERVICE_CARD_TITLE}  ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_service_card_title}  5s    error = The service card title is not displayed on the 'Services' page!

    click element    ${formatted_locator_service_card_title}

    log to console    Click on service card title

Click on 'Manage' button
    [Documentation]    Click on 'Manage' button

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_manage_button} =  Format String  ${MANAGE_BUTTON}  ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_manage_button}    30 sec    error = 'Manage' button is not displayed on the 'Services' page!
    click element    ${formatted_locator_manage_button}

    log to console    Click on 'Manage' button

Click on 'Manage' button, service 2
    [Documentation]    Click on 'Manage' button, service 2

    # ${SECOND_TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input second 'service name'' keyword
    ${formatted_locator_manage_button} =  Format String  ${MANAGE_BUTTON}  ${SECOND_TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_manage_button}    15 sec    error = 'Manage' button is not displayed on the 'Services' page!
    click element    ${formatted_locator_manage_button}
    capture page screenshot
    log to console    Click on 'Manage' button, service 2

Click on 'Set up/Manage allowlist' label
    [Documentation]    Click on 'Security аccess' label

#    FeatureFlags.Feature flag 'Dual Endpoints' condition

    wait until element is visible    ${SETUP_MANAGE_ALLOWLIST_LABEL}  5s    error = 'Set up/Manage allowlist' label is not displayed on 'Services' page!
    click element    ${SETUP_MANAGE_ALLOWLIST_LABEL}

    log to console    Click on 'Set up/Manage allowlist' label

Click on 'Stop service' label
    [Documentation]    Click on 'Stop service' label

    wait until element is visible    ${STOP_SERVICE_BUTTON}  5s    error = 'Stop service' label is not displayed on 'Services' page!

    click element    ${STOP_SERVICE_BUTTON}

    log to console    Click on 'Stop service' label

Click on 'Start service' label
    [Documentation]    Click on 'Start service' label

    wait until element is visible    ${START_SERVICE_BUTTON}  5s    error = 'Stop service' label is not displayed on 'Services' page!

    click element    ${START_SERVICE_BUTTON}

    log to console    Click on 'Start service' label

Click on 'Xpand Global Replication' label
    [Documentation]    Click on 'Xpand Global Replication' label

    wait until element is visible    ${XPAND_REPLICATION_BUTTON}  15s    error = 'Xpand Global Replication' label is not displayed on 'Services' page!

    click element    ${XPAND_REPLICATION_BUTTON}    action_chain=True
    capture page screenshot
    log to console    Click on 'Xpand Global Replication' label

Click on 'Xpand Global Replication' label 2
    [Documentation]    Click on 'Xpand Global Replication' label 2

    ${formatted_xpand_replication_service_label} =    format string    ${XPAND_REPLICATION_SERVICE_LABEL}   ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_xpand_replication_service_label}   15s    error = 'Xpand Global Replication' label 2 is not displayed on 'Services' page!
    click element    ${formatted_xpand_replication_service_label}    action_chain=True
    capture page screenshot
    log to console    Click on 'Xpand Global Replication' label 2

Wait for Xpand global replication status 'Active'
    [Documentation]    Wait for Xpand global replication status 'Active'

    ${service_card_title_formatted} =    format string    ${SERVICE_CARD_TITLE}    ${TOPOLOGY_NAME_VALUE}
    ${service_replication_status_active_formatted} =    format string    ${SERVICE_REPLICATION_STATUS_ACTIVE}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${service_card_title_formatted}    30s
    wait until element is visible    ${service_replication_status_active_formatted}    360s

    log to console    Wait for Xpand global replication status 'Active'

Click on 'Apply database configuration' label
    [Documentation]    Click on 'Apply database configuration' label

    wait until element is visible    ${APPLY_DB_CONFIG_LABEL}  5s    error = 'Apply database configuration' label is not displayed on 'Services' page!

    click element    ${APPLY_DB_CONFIG_LABEL}

    log to console    Click on 'Apply database configuration' label

Click on 'Scale Storage' label
    [Documentation]    Click on 'Scale Storage' label

    wait until element is visible    ${SCALE_STORAGE_SERVICE_LABEL}  15s    error = 'Scale Storage' label is not displayed on 'Services' page!

    click element    ${SCALE_STORAGE_SERVICE_LABEL}

    log to console    Click on 'Scale Storage' label

Click on 'Scale nodes In/Out' label
    [Documentation]    Click on 'Scale nodes In/Out' label

    wait until element is visible    ${SCALE_NODES_INOUT_SERVICE_LABEL}  15s    error = 'Scale nodes In/Out' label is not displayed on 'Services' page!

    click element    ${SCALE_NODES_INOUT_SERVICE_LABEL}

    log to console    Click on 'Scale nodes In/Out' label

Click on 'Scale nodes up/down' label
    [Documentation]    Click on 'Scale nodes up/down' label

    wait until element is visible    ${SCALE_NODES_UPDOWN_SERVICE_LABEL}  15s    error = 'Scale nodes up/down' label is not displayed on 'Services' page!

    click element    ${SCALE_NODES_UPDOWN_SERVICE_LABEL}

    log to console    Click on 'Scale nodes up/down' label

Click on 'Set up/Manage PSC/PL' label
    [Documentation]    Click on 'Set up/Manage PSC/PL' label
    wait until element is visible    ${SET_UP_MANAGE_PSC_PL_LABEL}  15s    error = 'Set up/Manage PSC/PL' label is not displayed on 'Services' page!

    click element    ${SET_UP_MANAGE_PSC_PL_LABEL}

    log to console    Click on 'Set up/Manage PSC/PL' label

Click on 'Connect' button
    [Documentation]    Click on 'Service Setting Gear' button

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_connect_to_service_button} =  Format String  ${CONNECT_BUTTON}  ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_connect_to_service_button}    6 sec    error = 'Connect' button is not displayed on 'Services' page!
    click element    ${formatted_locator_connect_to_service_button}

    log to console    Click on 'Connect' button

Validate 'Connect' button is disabled
    [Documentation]    Validate 'Connect' button is disabled

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_connect_to_service_button} =  Format String  ${CONNECT_BUTTON_DISABLED}  ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_connect_to_service_button}    6 sec    error = 'Connect' button is not disabled or is missing on the 'Services' page!

    log to console    Validate 'Connect' button is disabled

Click on 'Delete Service' label
    [Documentation]    Click on 'Delete Service' label

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${formatted_locator_delete_service} =   Format String    ${DELETE_SERVICE_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_delete_service}    5 sec    error = 'Delete Service' text is not displayed on 'Services' page!
    click element    ${formatted_locator_delete_service}

    log to console    Click on 'Delete Service' label

Click on 'Delete Service' label, service 2
    [Documentation]    Click on 'Delete Service' label, service 2

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${formatted_locator_delete_service} =   Format String    ${DELETE_SERVICE_LABEL}    ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_delete_service}    5 sec    error = 'Delete Service' text is not displayed on 'Services' page!
    click element    ${formatted_locator_delete_service}

    log to console    Click on 'Delete Service' label, service 2


Verify topology is not present anymore
    [Documentation]    Verify topology is no longer present in the services dashboard.

    # ${TOPOLOGY_NAME_VALUE} variable is set in LaunchServiceDetailsKeywords.Input 'Service Name',
    # For Serverless it is set in LaunchServiceDetailsKeywords.Input 'Service Name'
    TRY
        variable should not exist    ${TOPOLOGY_NAME_VALUE}
    EXCEPT
        wait until element is visible    ${SERVICES_PAGE_TITLE}    5 sec    error = 'Services' page title is not displayed!
        run keyword and warn on failure    wait until page does not contain    ${TOPOLOGY_NAME_VALUE}    10 min    error = ${TOPOLOGY_NAME_VALUE} topology is still present on the 'Services' page!
        capture page screenshot
    END

    log to console    Verify topology is not present anymore

Verify topology is not present anymore, service 2
    [Documentation]    Verify topology is no longer present in the services dashboard.

    # ${SECOND_TOPOLOGY_NAME_VALUE} variable is set in LaunchServiceDetailsKeywords.Input second 'Service Name',
    # For Serverless it is set in LaunchServiceDetailsKeywords.Input 'Service Name'
    TRY
        variable should not exist    ${SECOND_TOPOLOGY_NAME_VALUE}
    EXCEPT
        wait until element is visible    ${SERVICES_PAGE_TITLE}    5 sec    error = 'Services' page title is not displayed!
        wait until page does not contain    ${SECOND_TOPOLOGY_NAME_VALUE}    10 min    error = ${SECOND_TOPOLOGY_NAME_VALUE} topology is still present on the 'Services' page!
        capture page screenshot
    END

    log to console    Verify topology is not present anymore, service 2

Verify 'Dashboard Launch Button' button is displayed
    [Documentation]    Verify 'Dashboard Launch Button' button is displayed

    wait until element is visible    ${DASHBAORD_LAUNCH_BUTTON}    15s    error = 'Get Started' button is not displayed on the 'Connect' page!

Verify 'Manage' button is displayed
    [Documentation]    Verify 'Manage' button is displayed

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_manage_button} =  Format String  ${MANAGE_BUTTON}  ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_manage_button}    30 sec    error = 'Manage' button is not displayed on the 'Services' page!

    log to console    Click on 'Manage' button

Verify 'Connect' button is displayed
    [Documentation]    Verify 'Connect' button is displayed

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_connect_to_service_button} =  Format String  ${CONNECT_BUTTON}  ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_connect_to_service_button}    30 sec    error = 'Connect' button is not displayed on the 'Services' page!

    log to console    Click on 'Connect' button

Verify 'Get Started' button is displayed
    [Documentation]    Verify 'Get Started' button is displayed

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' -> 'Input 'service name'' keyword
    ${formatted_locator_connect_to_service_button} =  Format String  ${GET_STARTED_BUTTON}  ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_connect_to_service_button}    30 sec    error = 'Connect' button is not displayed on the 'Services' page!

    log to console    Click on 'Connect' button
