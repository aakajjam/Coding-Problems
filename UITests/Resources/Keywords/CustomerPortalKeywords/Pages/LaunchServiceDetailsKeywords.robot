*** Settings ***

Documentation    Launch Service Details Page Keywords
Library          SeleniumLibrary
Library          String
Library          DateTime
Library          Collections
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../../Utils/Helpers.robot
Resource    ../Modals/StartServiceKeywords.robot

*** Variables ***
${LAUNCH_A_CLOUD_DATABASE_TITLE} =          xpath = //*[contains(text(),'Launch a Cloud Database')]
${SERVICE_TYPE_LABEL}                       xpath = //*[contains(@class, 'clickable-element') and .//text()[contains(., '${type}')]]
${TOPOLOGY_LABEL}                           xpath = //*[contains(@class, 'topology-container') and .//text()[contains(., '${topology}')]]
${CLOUD_PROVIDER_BUTTON} =                  css = div[data-test-id="btn-cloud-select-{}"]
${CLOUD_PROVIDER_LABEL} =                   xpath = //*[@data-auto='launchServicecloudProviderPanel-content-{}']
${REGION_LABEL} =                           xpath = //*[contains(@class, 'region-wrapper') and .//text()[contains(., '{}')]]
${INSTANCE_SIZE_LABEL} =                    xpath = //*[@data-auto='launchServiceconfigurationPanel-content-instanceList']//*[contains(text(),'{}')]
${REPLICAS_ADD_BUTTON} =                    xpath = //button[@data-auto='launchServiceconfigurationPanel-undefined-content-replica-add']
${REPLICAS_CURRENT_VALUE} =                 xpath = //*[@class='replica-controls']
${REPLICAS_SUBSTRACT_BUTTON}                xpath = //button[@data-auto='launchServiceconfigurationPanel-undefined-content-replica-subtract']
${TRANSACTIONAL_STORAGE_DRAGGED_ELEMENT} =  xpath = //*[contains(text(),'storage size')]//..//*[@class='v-slider__thumb']
${TRANSACTIONAL_STORAGE_DROPPED_ELEMENT} =  xpath = //*[@id='configurationPanel']//span[{}]
${TRANSACTIONAL_STORAGE_SELECTED_SIZE} =    xpath = //*[contains(text(),'Transactional storage size:')]//a
${SERVER_VERSION_RADIO_BUTTON} =            xpath = //*[@data-auto='launchServiceservePanel-content-serverList']//*[contains(text(),'{}')]
${SERVICE_ATTRIBUTES_PANEL_CONTENTS}        xpath = //*[@data-auto='launchServiceservePanel-content']
#${SERVICE_NAME_INPUT} =                     xpath = //*[@data-auto='launchServiceservePanel-content-serviceName-input']
${SERVICE_NAME_INPUT}                       css = input[data-test-id='input-service-name']
#${SERVICE_NAME_INPUT}                       css=input[type='text']
${DISABLE_SSL_TLS_CHECKBOX} =               xpath = //*[contains(text(),'Disable SSL/TLS')]
#${LAUNCH_SERVICE_BUTTON} =                  xpath = //*[@data-auto='launchService-launchService-btn'][not(@disabled)]
${LAUNCH_SERVICE_BUTTON}                    css=button.launch-button
${CLOUD_PROVIDER_ARROW_EXPANDED}            xpath = //*[@data-auto='launchServicecloudProviderPanel-header' and @aria-expanded='true']
${CLOUD_PROVIDER_ARROW_SHRINKED}            xpath = //*[@data-auto='launchServicecloudProviderPanel-header']
${INSTANCE_STORAGE_REP_ARROW_EXPANDED}      xpath = //*[@data-auto='launchServiceconfigurationPanel-header' and @aria-expanded='true']
${INSTANCE_STORAGE_REP_ARROW_SHRINKED}      xpath = //*[@data-auto='launchServiceconfigurationPanel-header']
#${SERVICE_ATTRIBUTES_ARROW_EXPANDED}        xpath = //*[@data-auto='launchServiceservePanel-header' and @aria-expanded='true']
${SERVICE_ATTRIBUTES_ARROW_EXPANDED}        id=serverPanel
${SERVICE_ATTRIBUTES_ARROW_SHRINKED}        xpath = //*[@data-auto='launchServiceservePanel-header']
${ADDITIONAL_OPTIONS_ARROW_EXPANDED}        xpath = //*[@data-auto='launchServiceoptionsPanel-header' and @aria-expanded='true']
${MAXSCALE_REDUNDANCY_CHECKBOX} =           xpath = //*[contains(text(),'Enable MaxScale redundancy')]
${MAXSCALE_INSTANCE_SIZE_DROPDOWN} =        xpath = //*[contains(text(),'Select MaxScale instance size')]//..//*[@class='v-select__selections']//span[1]
${MAXSCALE_INSTANCE_SIZE_DROPDOWN_LABEL} =  xpath = //*[@class='v-list-item v-list-item--link theme--light']//*[contains(text(),'Sky-{}')]
${MAXSCALE_NODES_DROPDOWN} =                xpath = //*[contains(text(),'Select number of MaxScale nodes')]//..//*[@class='v-select__slot']
${MAXSCALE_NODES_DROPDOWN_LABEL} =          xpath = //*[@class='v-list-item__title' and contains(text(),'{}')]
${MAINTENANCE_WINDOW_DROPDOWN} =            xpath = //*[@data-auto='launchServiceservePanel-content-maintenanceWindow']//*[@role='button']
${MAINTENANCE_WINDOW_DROPDOWN_VALUE} =      xpath = //*[@role='option']//*[contains(text(),'{}')]
${MAINTENANCE_WINDOW_DROPDOWN_LIST} =       xpath = //*[@data-auto='launchServiceservePanel-content-maintenanceWindow']//*[@role='listbox']
${SECURITY_PANEL_CONTENTS} =                xpath = //*[@data-auto='launchServicesecurityPanel-content']
${SECURITY_ARROW_EXPANDED} =                xpath = //*[@data-auto='launchServicesecurityPanel-header' and @aria-expanded='true']
${SECURITY_ARROW_SHRINKED} =                xpath = //*[@data-auto='launchServicesecurityPanel-header']
${ADD_CURRENT_IP_CHECKBOX} =                xpath = //*[contains(text(), 'Add my current IP')]
${STORAGE_TYPE_IO1_RADIO_BUTTON}            xpath = //label[text()='io1']//..//*[contains(@class,'ripple')]
${IOPS_LAUNCH_FLOW_INPUT}                   xpath = //input[@type = 'number']
${SINGLE_ZONE_BLANK_CHECKBOX}               xpath = //*[contains(@data-auto, 'cloudProviderPanel')]//*[contains(@class, 'mdi-checkbox-blank')]
${SINGLE_ZONE_MARKED_CHECKBOX}              xpath = //*[contains(@data-auto, 'cloudProviderPanel')]//*[contains(@class, 'mdi-checkbox-marked')]
${AWS_GCP_PRIMARY_ENDPOINT_RADIO_BUTTON} =  xpath = //*[@data-auto='launchServicesecurityPanel-primary-endpoint.psc']//..//..//*[contains(text(),'{}')]
#${ADD_SECONDARY_ENDPOINT_BUTTON} =          xpath = //button[@data-auto='launchServicesecurityPanel-secondary-endpoint.add-endpoint']
${ADD_SECONDARY_ENDPOINT_BUTTON}            css=button[data-test-id="btn-add-secondary-endpoint"]

*** Keywords ***

Verify page title is 'Launch a Cloud Database'
    [Documentation]    Verify page title is 'Launch a Cloud Database'

    log to console    Verifying page title is 'Launch a Cloud Database'
    wait until element is visible  ${LAUNCH_A_CLOUD_DATABASE_TITLE}  15s  error = 'Launch a Cloud Database' page is not displayed!
    ${launch_a_cloud_database_actual_title} =  get text  ${LAUNCH_A_CLOUD_DATABASE_TITLE}

    # ${LAUNCH_A_CLOUD_DATABASE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    should be equal as strings  ${launch_a_cloud_database_actual_title}  ${LAUNCH_A_CLOUD_DATABASE_EXPECTED_TITLE}

    log to console    Verify page title is 'Launch a Cloud Database'

Select 'Type' and 'Topology'
    [Documentation]    Select the Type,Topology according to the variables set in the arguments file
    [Arguments]    ${type}    ${topology}

    wait until element is visible     ${SERVICE_TYPE_LABEL}    15s    error = 'Type' is not displayed!
    click element    ${SERVICE_TYPE_LABEL}

    wait until element is visible     ${TOPOLOGY_LABEL}    15s    error = 'Topology' is not displayed!
    click element    ${TOPOLOGY_LABEL}

    ${TOPOLOGY_SHORT_NAME} =    set variable    ${TOPOLOGY_SHORT_NAME_DICT}[${topology}]
    set test variable    ${TOPOLOGY_SHORT_NAME}

    ${TOPOLOGY_LONG_NAME} =    set variable    ${TOPOLOGY_LONG_NAME_DICT}[${topology}]

    log to console    Select Type '${type}' and Topology '${TOPOLOGY_LONG_NAME}', short name - '${TOPOLOGY_SHORT_NAME}'

Select 'Cloud provider'
    [Documentation]    Select 'Cloud Provider'
    [Arguments]    ${cloud_provider}

    ${PLATFORM_TEXT_VALUE} =  set variable  ${cloud_provider}
    set test variable  ${PLATFORM_TEXT_VALUE}

    ${formatted_locator_cloud_provider} =  Format String  ${CLOUD_PROVIDER_BUTTON}  ${cloud_provider.lower()}
    wait until element is visible     ${formatted_locator_cloud_provider}    15s    error = Cloud Provider ${cloud_provider} is not displayed!
    click element    ${formatted_locator_cloud_provider}

    log to console    Select 'Cloud provider': ${cloud_provider}

Select 'Cloud provider' 2
    [Documentation]    Select 'Cloud Provider' 2. Select the provider for the second service launched in a single test scenario.
    [Arguments]    ${cloud_provider_2}

    TRY
        wait until element is visible    ${CLOUD_PROVIDER_ARROW_EXPANDED}    15s    error = 'Cloud Provider' table arrow is not expanded!
    EXCEPT
        wait until element is visible    ${CLOUD_PROVIDER_ARROW_SHRINKED}    30s    error = 'Cloud Provider' table arrow is not shrinked!
        click element    ${CLOUD_PROVIDER_ARROW_SHRINKED}
        log to console    The 'Cloud Provider' arrow is not expanded!
        log    The 'Cloud Provider' arrow is not expanded!
    END

    ${PLATFORM_TEXT_VALUE_2} =  set variable  ${cloud_provider_2}
    set test variable  ${PLATFORM_TEXT_VALUE_2}

    ${formatted_locator_cloud_provider} =  Format String  ${CLOUD_PROVIDER_LABEL}  ${cloud_provider_2}
    wait until element is visible    ${formatted_locator_cloud_provider}    15s    error = 'Cloud Provider' is not visible!
    click element    ${formatted_locator_cloud_provider}
    ${selected_cloud_provider} =  get text  ${formatted_locator_cloud_provider}

    log to console    Select 'Cloud provider' 2: ${selected_cloud_provider}

Select region
    [Documentation]    Choose a region
    [Arguments]    ${region_value}

    ${formatted_locator_region_text} =  Format String  ${REGION_LABEL}  ${region_value}

    wait until element is visible    ${formatted_locator_region_text}    15s    error = 'region' is not visible!
    scroll element into view    ${formatted_locator_region_text}
    #wait until keyword succeeds    3x    1 sec    scroll element into view    ${formatted_locator_region_text}
    click element    ${formatted_locator_region_text}
    ${selected_region_column} =  get text  ${formatted_locator_region_text}

    log to console    Select region: ${selected_region_column}

Select region 2
    [Documentation]    Choose a region 2. Choose the region for the second service launched in a single test scenario.
    [Arguments]    ${region_value_2}

    ${formatted_locator_region_text} =  Format String  ${REGION_LABEL}  ${region_value_2}

    wait until element is visible    ${formatted_locator_region_text}    15s    error = 'region' is not visible!
#    wait until keyword succeeds    3x    1 sec    scroll element into view    ${formatted_locator_region_text}
    click element    ${formatted_locator_region_text}
    ${selected_region_column} =  get text  ${formatted_locator_region_text}

    log to console    Select region 2: ${selected_region_column}

Select Single Zone checkbox
    [Documentation]    Select Single Zone checkbox

    wait until element is visible    ${SINGLE_ZONE_BLANK_CHECKBOX}    15s    error = 'Single Zone' checkbox is not displayed on the 'Launch a new service' page!
    ${checkbox_mark} =    run keyword and return status    element should be visible    ${SINGLE_ZONE_MARKED_CHECKBOX}
    WHILE    ${checkbox_mark} == False
        click element    ${SINGLE_ZONE_BLANK_CHECKBOX}    action_chain=True
        ${checkbox_mark} =    run keyword and return status    element should be visible    ${SINGLE_ZONE_MARKED_CHECKBOX}
    END

    log to console    Select Single Zone checkbox

Select 'instance size'
    [Documentation]    Select 'instance size'
    [Arguments]    ${instance_size_value}

    TRY
        wait until element is visible    ${INSTANCE_STORAGE_REP_ARROW_EXPANDED}    15s    error = 'Instance size' table arrow is not expanded!
    EXCEPT
        wait until element is visible    ${INSTANCE_STORAGE_REP_ARROW_SHRINKED}    30s    error = 'Instance size' table arrow is not shrinked!
        click element    ${INSTANCE_STORAGE_REP_ARROW_SHRINKED}
        log to console    The 'Instance, storage, replicas' arrow is not expanded!
        log    The 'Instance, storage, replicas' arrow is not expanded!
    END

    ${formatted_locator_instance_size} =  Format String    ${INSTANCE_SIZE_LABEL}    ${instance_size_value}
    wait until element is visible    ${formatted_locator_instance_size}    30 sec    error = 'Instance Size' is not displayed!

    wait until keyword succeeds    3x    1 sec   click element    ${formatted_locator_instance_size}
    ${selected_instance_size} =  get text  ${formatted_locator_instance_size}

    log to console    Select 'instance size': ${selected_instance_size}

Get current 'replicas'
    [Documentation]  This keyword reads from the UI the current replicas value

    wait until element is visible    ${REPLICAS_CURRENT_VALUE}    5 sec    error = The current replicas value is not displayed!

    # The replicas value in the UI is got by element locator, which contains 'x', e.g. 'x 2'.
    # That's why we should split the text got by the element locator.
    ${replicas_current_text} =  get text  ${REPLICAS_CURRENT_VALUE}
    @{replicas_current_text_split} =  split string  ${replicas_current_text}
    ${REPLICAS_GET_VALUE} =  get from list  ${replicas_current_text_split}  1

    wait until keyword succeeds    3x    1 sec    scroll element into view    ${REPLICAS_CURRENT_VALUE}
    run keyword if    '${REPLICAS_GET_VALUE}'=='${EMPTY}'    capture page screenshot

    set test variable     ${REPLICAS_GET_VALUE}

Set replicas/nodes
    [Documentation]    Sets the number of replicas/nodes in the UI to the value given with the REPLICAS argument
    [Arguments]    ${replicas_value}    ${REPLICAS_GET_VALUE}

    # ${REPLICAS_GET_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Get current 'replicas'' keyword
    IF    ${replicas_value}==${REPLICAS_GET_VALUE}
        log to console    Select 'replicas/nodes': ${REPLICAS_GET_VALUE}
    END
    IF    ${replicas_value} > ${REPLICAS_GET_VALUE}
        click element    ${REPLICAS_ADD_BUTTON}
        Get current 'replicas'
    # ${REPLICAS} variable is passed from related topology (P/R, Xpand or CS) config file
        Set replicas/nodes    ${REPLICAS}    ${REPLICAS_GET_VALUE}
    ELSE IF    ${replicas_value} < ${REPLICAS_GET_VALUE}
        click element    ${REPLICAS_SUBSTRACT_BUTTON}
        Get current 'replicas'
        Set replicas/nodes    ${REPLICAS}    ${REPLICAS_GET_VALUE}
    END

Select 'replicas/nodes'
    [Documentation]    Selects the number of replicas or nodes

    IF    '${topology}' == 'Distributed' or '${topology}' == 'Replica'
        LaunchServiceDetailsKeywords.Get current 'replicas'
        # ${REPLICAS} variable is passed from related topology (P/R, Xpand or CS) config file
        # ${REPLICAS_GET_VALUE} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Get current 'replicas'' keyword
        LaunchServiceDetailsKeywords.Set replicas/nodes    ${REPLICAS}    ${REPLICAS_GET_VALUE}
        log to console    ${REPLICAS_GET_VALUE} replicas/nodes have been selected.
    END

Select 'Transactional storage size'
    [Documentation]     Select 'Transactional storage size'
    [Arguments]    ${transactional_storage_size_value}

    # This is a temporary solution in sync with the current UI changes. Once DBAAS-10624 is resolved this will be invalid.
    ${size} =    get text    ${TRANSACTIONAL_STORAGE_SELECTED_SIZE}
    wait until element is visible    ${TRANSACTIONAL_STORAGE_DRAGGED_ELEMENT}

    TRY
        click element    ${TRANSACTIONAL_STORAGE_DRAGGED_ELEMENT}
    EXCEPT
        FOR    ${i}    IN RANGE    3
            press keys    None    ARROW_UP
            sleep    1
        END
        click element    ${TRANSACTIONAL_STORAGE_DRAGGED_ELEMENT}
    END

    WHILE    ${size} != ${transactional_storage_size_value}    limit= 18
        press keys    None    ARROW_RIGHT
        ${size} =    get text    ${TRANSACTIONAL_STORAGE_SELECTED_SIZE}
    END
    log to console    Select 'Transactional storage size': ${size}

Tick 'Enable MaxScale redundancy' checkbox
    [Documentation]    Tick 'Enable MaxScale redundancy' checkbox

    wait until element is visible    ${MAXSCALE_REDUNDANCY_CHECKBOX}    15 sec    error = 'Enable MaxScale redundancy' checkbox is not displayed on the 'Launch a new service' page!

    click element    ${MAXSCALE_REDUNDANCY_CHECKBOX}

    log to console  Tick 'Enable MaxScale redundancy' checkbox

Choose value from the 'Select number of MaxScale nodes' dropdown
    [Documentation]    Choose value from the 'Select number of MaxScale nodes' dropdown
    [Arguments]    ${TOPOLOGY}

    IF    '${TOPOLOGY}' == 'Distributed'
        click element    ${MAXSCALE_NODES_DROPDOWN}

        ${formatted_locator_maxscale_nodes_value} =  Format String    ${MAXSCALE_NODES_DROPDOWN_LABEL}    ${MAXSCALE_NODES}
        wait until element is visible    ${formatted_locator_maxscale_nodes_value}    15 sec    error = 'MaxScale nodes' value is not displayed on 'Launch Service Details' page!

        click element    ${formatted_locator_maxscale_nodes_value}
        ${maxscale_nodes_actual_value} =  get text  ${MAXSCALE_NODES_DROPDOWN}

        log to console    Choose value from the 'Select number of MaxScale nodes' dropdown: ${maxscale_nodes_actual_value}
    END

Choose value from the 'Select MaxScale instance size' dropdown
    [Documentation]    Choose to 'Select MaxScale instance size' value
    [Arguments]    ${maxscale_instance_size_value}

    click element    ${MAXSCALE_INSTANCE_SIZE_DROPDOWN}

    ${formatted_locator_maxscale_instance_size_value} =  Format String    ${MAXSCALE_INSTANCE_SIZE_DROPDOWN_LABEL}    ${maxscale_instance_size_value}
    wait until element is visible    ${formatted_locator_maxscale_instance_size_value}    15 sec    error = 'MaxScale instance size' value is not displayed on 'Launch Service Details' page!

    click element    ${formatted_locator_maxscale_instance_size_value}
    ${maxscale_instance_size_actual_value} =  get text  ${MAXSCALE_INSTANCE_SIZE_DROPDOWN}

    set test variable    ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE}
    log to console    Choose value from the 'Select MaxScale instance size' dropdown: ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE}

Select 'Server' version
    [Documentation]    Select 'Server' version
    [Arguments]    ${server_version_value}

    TRY
        wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_EXPANDED}    15s    error = 'Service attributes' arrow is not expanded!
    EXCEPT
        wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}    30s    error = 'Service attributes' arrow is not shrinked!
        click element    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}
        log to console    The 'Service Attributes' arrow is not expanded!
        log    The 'Service Attributes' arrow is not expanded!
    END

    ${formatted_locator_server_version} =  Format String    ${SERVER_VERSION_RADIO_BUTTON}  ${server_version_value}
    wait until element is visible    ${formatted_locator_server_version}    15s    error = 'Server' version is not displayed!

    click element    ${formatted_locator_server_version}
    ${formatted_locator_server_version_value} =  get text  ${formatted_locator_server_version}

    log to console  Select 'Server' version: ${formatted_locator_server_version_value}

Input 'Service Name'
    [Documentation]    Enter service name
    
    #${TOPOLOGY_NAME_VALUE} =  Helpers.Input service name    ${topology}

    #wait until page contains element    ${SERVICE_NAME_INPUT}    15 sec    error = Input 'Service Name' is not visible!
    #input text    ${SERVICE_NAME_INPUT}  ${TOPOLOGY_NAME_VALUE}

    #log to console    Input 'Service Name': ${TOPOLOGY_NAME_VALUE}

    #set test variable    ${TOPOLOGY_NAME_VALUE}

    # The below variable is a copy of ${TOPOLOGY_NAME_VALUE} and is considered only if the test scenario launches two services.
    # It is used to differentiate between service 1 and 2.
    #${TOPOLOGY_NAME_VALUE_1} =    set variable    ${TOPOLOGY_NAME_VALUE}
    #set test variable    ${TOPOLOGY_NAME_VALUE_1}

    [Arguments]    ${USE_DEFAULT_NAME}

    # TRY
    #     wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_EXPANDED}    15s    error = 'Service attributes' arrow is not expanded!
    # EXCEPT
    #     wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}    30s    error = 'Service attributes' arrow is not shrinked!
    #     click element    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}
    #     log to console    The 'Service Attributes' arrow is not expanded!
    #     log    The 'Service Attributes' arrow is not expanded!
    # END

    # May not need the line below
    #${TOPOLOGY_NAME_VALUE} =  Helpers.Input service name    ${topology} 

    #${TOPOLOGY_NAME_VALUE} =    Get Text    ${SERVICE_NAME_INPUT}
    wait until page contains element    ${SERVICE_NAME_INPUT}    15 sec    error = Input 'Service Name' is not visible!
    wait until keyword succeeds    3x    1 sec    scroll element into view    ${SERVICE_NAME_INPUT}
   
    #input text    ${SERVICE_NAME_INPUT}  ${TOPOLOGY_NAME_VALUE}

    #log to console    Input 'Service Name': ${TOPOLOGY_NAME_VALUE}

    #set test variable    ${TOPOLOGY_NAME_VALUE}    ${SERVICE_NAME_INPUT}.value

    # If we give boolean value as 'True' for ${USE_DEFAULT_NAME} then we will use the default name for the service.
    IF    $USE_DEFAULT_NAME
        ${NAME_VALUE} =    get value    ${SERVICE_NAME_INPUT}

        log to console    Input 'Service Name': ${NAME_VALUE}

        set suite variable    ${TOPOLOGY_NAME_VALUE}    ${NAME_VALUE}

    ELSE
        Scroll Element Into View    ${SERVICE_NAME_INPUT}
        ${TOPOLOGY_NAME_VALUE} =  Helpers.Input service name    ${topology} 

        Execute Javascript    document.querySelector('.v-text-field__slot input').value = ''
        sleep    10s

        Execute Javascript    document.querySelector('.v-text-field__slot input').dispatchEvent(new Event('input', { bubbles: true }));
        sleep    10s

        # Press Keys may not work because Vue can intercept them - may be better to use Execute Javascript
        #Press Keys    ${SERVICE_NAME_INPUT}    \ue003\ue004
        #sleep    10s

        #Press Key    ${SERVICE_NAME_INPUT}    \ue008
        #sleep    10s

        Input Text    ${SERVICE_NAME_INPUT}    ${TOPOLOGY_NAME_VALUE}
        Sleep    5s
        Set Suite Variable    ${TOPOLOGY_NAME_VALUE}
        Log To Console    ${TOPOLOGY_NAME_VALUE}
    END

Input second 'Service Name'
    [Documentation]    Enter service name for the second service

    ${TOPOLOGY_NAME_VALUE_2} =  Helpers.Input service name    ${topology}

    ${TOPOLOGY_NAME_VALUE} =    convert to string    ${TOPOLOGY_NAME_VALUE_2}[:16]-second
    set test variable    ${TOPOLOGY_NAME_VALUE}
    ${SECOND_TOPOLOGY_NAME_VALUE} =    convert to string    ${TOPOLOGY_NAME_VALUE_2}[:16]-second
    set test variable    ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${SERVICE_NAME_INPUT}    15 sec    error = Input 'Service Name' is not visible!
    input text    ${SERVICE_NAME_INPUT}  ${TOPOLOGY_NAME_VALUE}

    log to console    Input 'Service Name': ${TOPOLOGY_NAME_VALUE}

Input 'Service Name' for Serverless
    [Documentation]    Enter service name
    [Arguments]    ${USE_DEFAULT_NAME}

    # TRY
    #     wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_EXPANDED}    15s    error = 'Service attributes' arrow is not expanded!
    # EXCEPT
    #     wait until element is visible    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}    30s    error = 'Service attributes' arrow is not shrinked!
    #     click element    ${SERVICE_ATTRIBUTES_ARROW_SHRINKED}
    #     log to console    The 'Service Attributes' arrow is not expanded!
    #     log    The 'Service Attributes' arrow is not expanded!
    # END

    # May not need the line below
    #${TOPOLOGY_NAME_VALUE} =  Helpers.Input service name    ${topology} 

    #${TOPOLOGY_NAME_VALUE} =    Get Text    ${SERVICE_NAME_INPUT}
    wait until page contains element    ${SERVICE_NAME_INPUT}    15 sec    error = Input 'Service Name' is not visible!
    wait until keyword succeeds    3x    1 sec    scroll element into view    ${SERVICE_NAME_INPUT}
   
    #input text    ${SERVICE_NAME_INPUT}  ${TOPOLOGY_NAME_VALUE}

    #log to console    Input 'Service Name': ${TOPOLOGY_NAME_VALUE}

    #set test variable    ${TOPOLOGY_NAME_VALUE}    ${SERVICE_NAME_INPUT}.value

    # If we give boolean value as 'True' for ${USE_DEFAULT_NAME} then we will use the default name for the service.
    IF    $USE_DEFAULT_NAME
        ${NAME_VALUE} =    get value    ${SERVICE_NAME_INPUT}

        log to console    Input 'Service Name': ${NAME_VALUE}

        set suite variable    ${TOPOLOGY_NAME_VALUE}    ${NAME_VALUE}

    ELSE
        Scroll Element Into View    ${SERVICE_NAME_INPUT}
        ${TOPOLOGY_NAME_VALUE} =  Helpers.Input service name    ${topology} 

        Execute Javascript    document.querySelector('.v-text-field__slot input').value = ''
        sleep    10s

        Execute Javascript    document.querySelector('.v-text-field__slot input').dispatchEvent(new Event('input', { bubbles: true }));
        sleep    10s

        # Press Keys may not work because Vue can intercept them - may be better to use Execute Javascript
        #Press Keys    ${SERVICE_NAME_INPUT}    \ue003\ue004
        #sleep    10s

        #Press Key    ${SERVICE_NAME_INPUT}    \ue008
        #sleep    10s

        Input Text    ${SERVICE_NAME_INPUT}    ${TOPOLOGY_NAME_VALUE}
        Sleep    5s
        Set Suite Variable    ${TOPOLOGY_NAME_VALUE}
        Log To Console    ${TOPOLOGY_NAME_VALUE}
    END

Choose value from the 'Maintenance window' dropdown
    [Documentation]    Choose value from the 'Maintenance window' dropdown
    [Arguments]    ${maintenance_window_value}

    click element    ${MAINTENANCE_WINDOW_DROPDOWN}
    wait until element is visible    ${MAINTENANCE_WINDOW_DROPDOWN_LIST}
    ${formatted_locator_maintenance_window_value} =  Format String    ${MAINTENANCE_WINDOW_DROPDOWN_VALUE}    ${maintenance_window_value}

    ${mw_visibility_check} =    run keyword and return status   element should be visible    ${formatted_locator_maintenance_window_value}
    WHILE    '${mw_visibility_check}' == 'False'    limit= 18
        press keys    None    ARROW_UP
        ${mw_visibility_check} =    run keyword and return status   element should be visible    ${formatted_locator_maintenance_window_value}
    END
    click element    ${formatted_locator_maintenance_window_value}

    wait until element does not contain    ${MAINTENANCE_WINDOW_DROPDOWN_LIST}    UTC    15s    error = No UTC timezones are displayed!
    ${maintenance_window_actual_value} =  get text  ${MAINTENANCE_WINDOW_DROPDOWN}
    capture page screenshot

    set test variable    ${MAINTENANCE_WINDOW_ACTUAL_VALUE}
    log to console    Choose value from the 'Maintenance window' dropdown: ${MAINTENANCE_WINDOW_ACTUAL_VALUE}

Validate the default value for 'Maintenance window'
    [Documentation]    Validate the default value for 'Maintenance window'

    ${maintenance_window_default_value} =  get text  ${MAINTENANCE_WINDOW_DROPDOWN}
    should not be empty    ${maintenance_window_default_value}

    log to console    Validate the default value for 'Maintenance window'

Tick 'Add my current IP' checkbox
    [Documentation]    Tick 'Add my current IP' checkbox option

    wait until element is visible    ${ADD_CURRENT_IP_CHECKBOX}    15 sec    error = 'Add my current IP' checkbox is not displayed on the 'Launch a new service' page!

    click element    ${ADD_CURRENT_IP_CHECKBOX}

    log to console  Tick 'Add my current IP' checkbox

Select primary endpoint 'AWS PrivateLink' or 'Google Private Service Connect'
    [Documentation]    Select primary endpoint 'AWS PrivateLink' or 'Google Private Service Connect' option
    [Arguments]    ${aws_gcp_primary_endpoint_value}

    ${formatted_locator_aws_gcp_primary_endpoint} =  Format String    ${AWS_GCP_PRIMARY_ENDPOINT_RADIO_BUTTON}  ${aws_gcp_primary_endpoint_value}
    wait until element is visible    ${formatted_locator_aws_gcp_primary_endpoint}    15s    error = 'AWS PrivateLink' or 'Google Private Service Connect' is not displayed on the 'Launch a new service' page!

    click element    ${formatted_locator_aws_gcp_primary_endpoint}
    ${formatted_locator_aws_gcp_primary_endpoint_value} =  get text  ${formatted_locator_aws_gcp_primary_endpoint}

    log to console  Select primary endpoint 'AWS PrivateLink' or 'Google Private Service Connect'elect 'Server' version: ${formatted_locator_aws_gcp_primary_endpoint_value}

Add Secondary Endpoint to IP AllowList Primary Endpoint
    [Documentation]    Add Secondary Endpoint to IP AllowList Primary Endpoint

    scroll element into view    ${ADD_SECONDARY_ENDPOINT_BUTTON}

    wait until element is visible    ${ADD_SECONDARY_ENDPOINT_BUTTON}    15 sec    error = 'Add Secondary Endpoint' button is not displayed on the 'Launch a new service' page!

    click element    ${ADD_SECONDARY_ENDPOINT_BUTTON}

    log to console    Add Secondary Endpoint to IP AllowList Primary Endpoint

Tick 'Disable SSL/TLS' checkbox
    [Documentation]    Tick 'Disable SSL/TLS' checkbox option

    wait until element is visible    ${DISABLE_SSL_TLS_CHECKBOX}    15 sec    error = 'Disable SSL/TLS' checkbox is not displayed on the 'Launch a new service' page!

    TRY
        click element    ${DISABLE_SSL_TLS_CHECKBOX}
    EXCEPT
        click element    ${SECURITY_PANEL_CONTENTS}
        Helpers.Scroll page by pressing the ARROW_DOWN button
        wait until keyword succeeds    3x    1 sec    click element    ${DISABLE_SSL_TLS_CHECKBOX}
    END

    log to console  Tick 'Disable SSL/TLS' checkbox

Click on 'Launch Service' button
    [Documentation]    Click on 'Launch Service' button

    wait until element is visible    ${LAUNCH_SERVICE_BUTTON}    15 sec    error = 'Launch Service' button is not displayed on the 'Launch a new service' page!
    set focus to element    ${LAUNCH_SERVICE_BUTTON}

    # The below block is used to scroll the ${LAUNCH_SERVICE_BUTTON} into view , using the arrow keys, and then click it.
    TRY
        Helpers.Scroll page by pressing the ARROW_DOWN button
        click element    ${LAUNCH_SERVICE_BUTTON}
    EXCEPT
        #click element    ${SERVICE_ATTRIBUTES_PANEL_CONTENTS}
        Helpers.Scroll page by pressing the ARROW_DOWN button
        wait until keyword succeeds    1m    2s    click element    ${LAUNCH_SERVICE_BUTTON}
    END

    capture page screenshot
    # There are various error messages that could be displayed in the UP after the
    sleep    1
    capture page screenshot

    log to console    Click on 'Launch Service' button

    # Setting global variable with current datatime, used for db health status timer
    ${start} =  Get Current Date
    Set Global Variable    ${start}

Select instance size for sanity test
    [Documentation]    Select instance size
    [Arguments]    ${instance_size_value}

    ${formatted_locator_instance_size} =  Format String    ${INSTANCE_SIZE_LABEL}    ${instance_size_value}

    wait until page contains element   ${formatted_locator_instance_size}

    click element    ${formatted_locator_instance_size}

    ${selected_instance_size} =  get text  ${formatted_locator_instance_size}

    log to console    Select instance size for sanity test: ${selected_instance_size}

Input Service Details for Sanity Single Node Transaction
    [Documentation]    Input service details for Transactions Single Node

    Verify page title is 'Launch a New Service'
    Click on 'Transactions' type
    Click on 'Enterprise Server Single node'
    Select 'Cloud Provider'    ${PROVIDER}
    FOR    ${REGION_COLUMN}    IN    @{REGION}
        Select region    ${REGION_LABEL}
    END
    FOR    ${inst_size}    IN    @{SIZE}
        Select instance size for sanity test    ${inst_size}
    END
    FOR    ${storage_content}    IN    @{STORAGE}
        Select 'Transactional storage size'    ${storage_content}
    END
    FOR    ${server_content}    IN    @{SERVER}
        Select 'Server' version    ${server_content}
    END
    Input 'Service Name'
    wait until element is visible     ${LAUNCH_SERVICE_BUTTON}    15s    error = 'Launch' button is not active!
    log to console    Input Service Details for Sanity Single Node Transaction

Input Service Details for Sanity Replicated Transactions
    [Documentation]    Input service details for Transactions Replicated

    Verify page title is 'Launch a New Service'
    Click on 'Transactions' type
    Click on 'Enterprise Server Replicated'
    Select 'Cloud Provider'    ${PROVIDER}
    FOR    ${REGION_LABEL}    IN    @{REGION}
        Select region    ${REGION_LABEL}
    END
    FOR    ${inst_size}    IN    @{SIZE}
        Select instance size for sanity test    ${inst_size}
    END
    FOR    ${node_content}    IN    @{NODES}
        Select Primary / Replica 'replicas'    ${node_content}
    END
    FOR    ${storage_content}    IN    @{STORAGE}
        Select 'Transactional storage size'    ${storage_content}
    END
    FOR    ${server_content}    IN    @{SERVER}
        Select 'Server' version    ${server_content}
    END
    Input 'service name'
    wait until element is visible     ${LAUNCH_SERVICE_BUTTON}    15s    error = 'Launch' button is not active!
    log to console    Input Service Details for Sanity Replicated Transactions

Input Service Details for Sanity Single Node Analytics
    [Documentation]    Input service details for Analytics Single Node

    Verify page title is 'Launch a New Service'
    Click on 'Analytics' type
    Click on 'ColumnStore Analytics Warehouse'
    Select 'Cloud Provider'    ${PROVIDER}
    FOR    ${REGION_LABEL}    IN    @{REGION}
        Select region    ${REGION_LABEL}
    END
    FOR    ${inst_size}    IN    @{SIZE}
        Select instance size for sanity test    ${inst_size}
    END
    Select 'Server' version    ${SERVER}
    Input 'service name'
    wait until element is visible     ${LAUNCH_SERVICE_BUTTON}    15s    error = 'Launch' button is not active!
    log to console    Input Service Details for Sanity Single Node Analytics

Input Service Details for Sanity Distributed Transactions
    [Documentation]    Input service details for Transactions Distributed

    Verify page title is 'Launch a New Service'
    Click on 'Transactions' type
    Click on 'Xpand Distributed SQL'
    Select 'Cloud Provider'    ${PROVIDER}
    FOR    ${REGION_LABEL}    IN    @{REGION}
    Select region    ${REGION_LABEL}
    END
    FOR    ${inst_size}    IN    @{SIZE}
        Select instance size for sanity test    ${inst_size}
    END
    FOR    ${node_content}    IN    @{NODE}
        Select Xpand 'replicas'    ${node_content}
    END
    FOR    ${storage_content}    IN    @{STORAGE}
        Select 'Transactional storage size'    ${storage_content}
    END
    Select 'Server' version    ${SERVER}
    Input 'service name'
    Wait Until Element Is Visible     ${LAUNCH_SERVICE_BUTTON}    15s    error = 'Launch' button is not active!
    log to console    Input Service Details for Sanity Distributed Transactions

Select storage type 'io1'
    [Documentation]    Select storage type 'io1' in the service launch flow.

    wait until element is visible    ${STORAGE_TYPE_IO1_RADIO_BUTTON}    15 sec    error = 'io1' radio button is not displayed on the 'Launch a new service' page!
    click element    ${STORAGE_TYPE_IO1_RADIO_BUTTON}    action_chain=True

    log to console    Select storage type 'io1'

Set number of IOPS
    [Arguments]    ${iops_initial}
    [Documentation]    Set the desired number of IOPS

    wait until element is visible    ${IOPS_LAUNCH_FLOW_INPUT}    15s    error = 'IOPS input' field is not visible on the 'Launch a new service' page!

    input text    ${IOPS_LAUNCH_FLOW_INPUT}    ${iops_initial}

    log to console    Set number of IOPS
