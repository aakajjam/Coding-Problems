*** Settings ***

Documentation    Service Details Tab Page Keywords
Library          SeleniumLibrary
Library          String

Resource        ./LaunchServiceDetailsKeywords.robot
Resource        ./ServicesDashboardKeywords.robot

*** Variables ***

${DETAILS_TAB_LINK}                      xpath = //*[contains(text(), 'Details')]
${DATABASE_CONFIGURATION_FIELD_VALUE}    xpath = //*[contains(text(), 'Database configuration')]//..//a
${MAXSCALE_REDUNDANCY_SIZE}              xpath = //*[@data-auto='service-details.maxscale-redundancy']//*[contains(text(),'Sky-{}')]
# Maintenance Window (MW) Locators
${MW_DATE_AND_TIME_VALUE}                xpath = //*[@data-auto='maintenance.date']//span
${MW_CHANGE_BUTTON}                      xpath = //*[@class='row']//*[contains(text(), 'Change')]
${MW_DROPDOWN}                           xpath = //*[@data-auto='maintenance.date']//*[@role='button']
${MW_DROPDOWN_VALUE}                     xpath = //*[@role='option']//*[contains(text(),'{}')]
${MW_DROPDOWN_LIST}                      xpath = //*[@data-auto='maintenance.date']//*[@role='listbox']
${MW_SAVE_BUTTON}                        xpath = //*[@class='row']//*[contains(text(), 'Save')]
${MW_DROPDOWN_UPDATED}                   xpath = //*[@class='v-card__text']//span
${IOPS_NUMBER_TEXT}                      xpath = //*[contains(text(), 'Spending')]//..//*[contains(text(), 'IOPS')]
${STORAGE_NUMBER_TEXT} =                 xpath = //*[contains(@data-auto, 'storage-size')]
${INSTANCE_SIZE_ROW_TEXT} =              xpath = //*[(@data-auto = 'service-details.instance-size')]
${REMOVE_ENDPOINT_LABEL} =               xpath = //*[(@data-auto = 'service-details.service-endpoints.endpoint.remove-endpoint')]
${MANAGE_BUTTON}                         css = .btn-service-action-manage
#${SERVICE_DETAILS_CONNECT_BUTTON}       xpath = //button[.//span[contains(translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'connect')]]
${SERVICE_DETAILS_CONNECT_BUTTON}        css = .btn-service-action-connect
${MONITORING_TAB}                        xpath = //a[contains(@href, '/monitoring')]
${ALERTS_TAB}                            xpath = //a[contains(@href, '/alerts')]
${DETAILS_TAB}                           xpath = //a[contains(@href, '/details')]
${UNDERLINED_SERVICE_NAME}               css = .service-card-title-success
${SERVICE_DETAILS_CARD}                  css = div[data-test-id="box-service-details"]
${SPENDING_CARD}                         css = div[data-test-id="box-spending"]
${MAINTENANCE_CARD}                      css = div[data-test-id="box-maintenance"]
${DATABASE_CONFIGURATION_CARD}           css = div[data-test-id="box-database-config"]
${PANEL_GRID}                            css = .db-grid
${PANEL_GRID_ITEM}                       css = .db-grid-item
${SERVICE_DETAILS_TITLE}                 css = .view-headline
${SERVICE_STATUS_STRIP}                  id = serviceStatusStrip

*** Keywords ***

Click on the 'Details' tab
    [Documentation]    Click on the 'Details' tab

    wait until element is visible    ${DETAILS_TAB_LINK}    15 sec    error = 'Details' tab is not displayed on the 'Service Details' page!
    click element    ${DETAILS_TAB_LINK}

    log to console    Click on the 'Details' tab

Compare 'Database configuration' field value with the applied config name
    [Documentation]    Compare 'Database configuration' field value is the same as the applied config name
    [Arguments]    ${CONFIG_NAME}

    wait until element is visible     ${DATABASE_CONFIGURATION_FIELD_VALUE}    5s    error = '${DATABASE_CONFIGURATION_FIELD_VALUE}' label is not displayed on the 'Service Details' page!

    wait until keyword succeeds    3x    2 sec    element should contain    ${DATABASE_CONFIGURATION_FIELD_VALUE}    ${CONFIG_NAME}    msg = 'Database configuration' field value does not match the applied config name.

    log to console    Compare 'Database configuration' field value with the applied config name

Click on the name of the applied custom config
    [Documentation]    Click on the name of the applied custom config

    wait until element is visible     ${DATABASE_CONFIGURATION_FIELD_VALUE}    5s    error = '${DATABASE_CONFIGURATION_FIELD_VALUE}' label is not displayed on the 'Service Details' page!

    click element    ${DATABASE_CONFIGURATION_FIELD_VALUE}

    log to console    Click on the name of the applied custom config

Compare 'MaxScale redundancy' instance size value with the chosen one
    [Documentation]    Compare 'MaxScale redundancy' instance size value with the choosen one
    [Arguments]    ${maxscale_instance_size_value}

    ${formatted_locator_maxscale_size_value} =  Format String    ${MAXSCALE_REDUNDANCY_SIZE}    ${maxscale_instance_size_value}
    wait until element is visible     ${formatted_locator_maxscale_size_value}    30s    error = 'MaxScale redundancy': ${formatted_locator_maxscale_size_value} size is not displayed on the 'Service Details' tab page!
    ${MAXSCALE_REDUNDANCY_SIZE_EXPECTED_VALUE} =    get text    ${formatted_locator_maxscale_size_value}

    # ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE} variable is passed from 'LaunchServiceDetailsKeywords' file -> 'Choose to 'Select MaxScale instance size' value' keyword
    should be equal as strings    ${MAXSCALE_REDUNDANCY_SIZE_EXPECTED_VALUE}[:-5]    ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE}    msg = 'MaxScale redundancy' size value does not match the initially chosen one: expected: ${MAXSCALE_REDUNDANCY_SIZE_EXPECTED_VALUE}[:-5], actual: ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE}

    log to console    Compare 'MaxScale redundancy' instance size value with the chosen one: expected is: ${MAXSCALE_REDUNDANCY_SIZE_EXPECTED_VALUE}[:-5] & actual is: ${MAXSCALE_INSTANCE_SIZE_ACTUAL_VALUE}

Compare 'Maintenance' field value with the applied maintenance window
    [Documentation]    Compare 'Maintenance' field value is the same as the applied maintenance window

    wait until element contains    ${MW_DATE_AND_TIME_VALUE}    :    15s    error = 'Date and Time' label is not displayed on the 'Service Details' page!
    ${date_and_time_value_text} =    get text    ${MW_DATE_AND_TIME_VALUE}
    capture page screenshot

    # ${MAINTENANCE_WINDOW_ACTUAL_VALUE} variable is passed from 'LaunchServiceDetailsKeywords' file -> 'Choose value from the 'Maintenance window' dropdown' keyword
    should be equal as strings    ${date_and_time_value_text}    ${MAINTENANCE_WINDOW_ACTUAL_VALUE}    msg = 'Maintenance' field value does not match the applied maintenance window.

    log to console    Compare 'Maintenance' field value with the applied maintenance window: 'Date and Time' is ${date_and_time_value_text} & 'Maintenance windows' is ${MAINTENANCE_WINDOW_ACTUAL_VALUE}

Change 'Maintenance window' field value
    [Documentation]    Change value of the 'Maintenance window' field with a new value
    [Arguments]    ${maintenance_window_changed_value}

    click element    ${MW_CHANGE_BUTTON}

    wait until element is visible    ${MW_DROPDOWN}    15s    error = 'Maintenance' window dropdown is not displayed on the 'Service Details' page!
    click element    ${MW_DROPDOWN}

    ${formatted_locator_mw_changed_value} =  Format String    ${MW_DROPDOWN_VALUE}    ${maintenance_window_changed_value}

    ${mw_visibility_check} =    run keyword and return status   element should be visible    ${formatted_locator_mw_changed_value}
    WHILE    '${mw_visibility_check}' == 'False'    limit= 18
        press keys    None    ARROW_UP
        ${MW_visibility_check} =    run keyword and return status   element should be visible    ${formatted_locator_mw_changed_value}
    END
    click element    ${formatted_locator_mw_changed_value}    action_chain=True

    wait until element does not contain    ${MW_DROPDOWN_LIST}    UTC    15s    error = No UTC timezones are displayed!

    wait until element is visible    ${MW_SAVE_BUTTON}    15s    error = 'Save' button is not displayed on the 'Service Details' page!
    click element    ${MW_SAVE_BUTTON}
    wait until element is not visible    ${MW_SAVE_BUTTON}    15s    error = 'Save' button is still displayed!

    ${mw_actual_changed_value} =  get text  ${MW_DROPDOWN_UPDATED}
    capture page screenshot

    set test variable    ${MW_ACTUAL_CHANGED_VALUE}
    log to console    Change 'Maintenance window' field value. The new value is: ${MW_ACTUAL_CHANGED_VALUE}

Compare new 'Date and Time' field value with the applied new maintenance window
    [Documentation]    Compare new 'Date and Time' field value is different from the initial set

    # ${MW_ACTUAL_CHANGED_VALUE} variable is passed from 'ServiceDetailsKeywords' file -> 'Change 'Maintenance window' field value' keyword
    # ${MAINTENANCE_WINDOW_ACTUAL_VALUE} variable is passed from 'LaunchServiceDetailsKeywords' file -> 'Choose value from the 'Maintenance window' dropdown' keyword
    should not be equal as strings    ${MW_ACTUAL_CHANGED_VALUE}    ${MAINTENANCE_WINDOW_ACTUAL_VALUE}    msg = 'Maintenance' field value does not changed with a new one.

    log to console    Compare new 'Date and Time' field value with the applied new maintenance window

Verify IOPS number displayed in the service 'Details' tab
    [Documentation]    Verify IOPS number displayed in the service 'Details' tab

    wait until element is visible    ${IOPS_NUMBER_TEXT}    15s    error = IOPS number is not displayed on the 'Service Details' page!
    element should contain   ${IOPS_NUMBER_TEXT}    ${IOPS_CALCULATED_NUMBER}

    log to console    Verify IOPS number displayed in the service 'Details' tab

Verify the Storage number displayed in the service 'Details' tab
    [Arguments]    ${storage_altered}
    [Documentation]    Verify the Storage number displayed in the service 'Details' tab

    wait until element is visible    ${STORAGE_NUMBER_TEXT}    15s    error = Storage number is not displayed on the 'Service Details' page!
    element should contain   ${STORAGE_NUMBER_TEXT}    ${storage_altered}

    log to console    Verify the Storage number displayed in the service 'Details' tab

Verify the instance size displayed in the service 'Details' tab
    [Arguments]    ${size_altered}
    [Documentation]    Verify the instance size displayed in the service 'Details' tab

    wait until element contains    ${INSTANCE_SIZE_ROW_TEXT}    ${size_altered}    15s    error = Insance size is not correctly displayed on the 'Service Details' page!

    log to console    Verify the instance size displayed in the service 'Details' tab

Click on Remove Secondary endpoint label
    [Documentation]    Click on Remove Secondary endpoint label

    wait until element is visible    ${REMOVE_ENDPOINT_LABEL}    15 sec    error = 'Remove Endpoint' is not displayed on the 'Service Details' page!
    click element    ${REMOVE_ENDPOINT_LABEL}

    log to console    Click on Remove Secondary endpoint label

Verify user is on service details page
    [Documentation]    Verify user is on details page, done through the URL
    wait until location contains    /monitoring/overview    15 sec    error = User is not on the 'Service Details' page!

Verify service name title
    [Documentation]    Verify service name title is shown on the 'Service Details' page
    wait until element is visible    ${SERVICE_DETAILS_TITLE}    5 sec   error = 'Service name' title is not displayed on the 'Service Details' page!

Verify service status strip is displayed
    [Documentation]    Verify service status strip is displayed on the 'Service Details' page
    wait until element is visible    ${SERVICE_STATUS_STRIP}    5 sec   error = 'Service status strip' is not displayed on the 'Service Details' page!

Verify 'Connect' and 'Manage' tabs are displayed
    [Documentation]    Verify 'Connect' and 'Manage' buttons are displayed on the 'Service Details' page
    
    wait until element is visible    ${MANAGE_BUTTON}    5 sec    error = 'Manage' button is not displayed on the 'Service Details' page!

    # DO NOT REMOVE THE FOLLOWING LINE, IT IS USED FOR DEBUGGING PURPOSES
   # Log To Console    CONNECT LOCATOR: ${CONNECT_BUTTON}
    #wait until element is visible   xpath=//button[.//span[translate(normalize-space(.), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'connect']]    5 sec    error = 'Connect' button is not displayed on the 'Service Details' page!  
    wait until element is visible    ${SERVICE_DETAILS_CONNECT_BUTTON}    5 sec    error = 'Connect' button is not displayed on the 'Service Details' page!
    
Verify 'Monitoring', Alerts', 'Details' tabs are displayed
    [Documentation]    Verify 'Monitoring', 'Alerts', and 'Details' tabs are displayed on the 'Service Details' page
    wait until element is visible    ${MONITORING_TAB}    15 sec    error = 'Monitoring' tab is not displayed on the 'Service Details' page!
    Wait Until Element Is Visible    ${PANEL_GRID}    15 sec    error = 'Service Details panel grid' is not displayed on the 'Service Details' page!
    Wait Until Element Is Visible    ${PANEL_GRID_ITEM}    15 sec    error = 'Service Details panel grid item' is not displayed on the 'Service Details' page!
    wait until element is visible    ${ALERTS_TAB}    15 sec    error = 'Alerts' tab is not displayed on the 'Service Details' page!
    
    wait until element is visible    ${DETAILS_TAB}    15 sec    error = 'Details' tab is not displayed on the 'Service Details' page!
    

Verify 'status', 'database', 'alerts', 'queries', 'system' tabs are displayed
    [Documentation]    Verify 'status', 'database', 'alerts', 'queries', 'system' tabs are displayed on the 'Service Details' page

    # Wait for all the buttons to be visible
    wait until element is visible   css=.db-links    10 sec    error = 'Status', 'Database', 'Alerts', 'Queries', and 'System' tabs are not displayed on the 'Service Details' page!

Verify an underlined service name and click
    [Documentation]    Verify an underlined service name is displayed on the 'Service Details' page and is clickable

    TRY
        wait until element is visible    ${UNDERLINED_SERVICE_NAME}    15 sec    error = 'Service name' is not displayed on the 'Service Details' page!
        click element    ${UNDERLINED_SERVICE_NAME}   
        log to console    Clicked on the service name
    EXCEPT
        log to console    Service name is not clickable
        ServicesDashboardKeywords.Click on 'Launch a cloud database' button
        LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
        LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
        LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
        LaunchServiceDetailsKeywords.Select region    ${REGION}
        LaunchServiceDetailsKeywords.Input 'Service Name' for Serverless    ${USE_DEFAULT_NAME}
        LaunchServiceDetailsKeywords.Click on 'Launch Service' button
        ServicesDashboardKeywords.Verify page title is 'Services'
        ServicesDashboardKeywords.Wait for status 'Healthy'
        click element    ${UNDERLINED_SERVICE_NAME}
    END
    
Verify widgets in 'Details' tab
    [Documentation]    Verify widgets in 'Details' tab
    
    click element    ${DETAILS_TAB}

    Wait Until Element Is Visible    ${SERVICE_DETAILS_CARD}   15 sec    error = 'Service Details' widget is not displayed on the 'Service Details' page!
    Wait Until Element Is Visible    ${SPENDING_CARD}    15 sec    error = 'Spending' widget is not displayed on the 'Service Details' page!
    Wait Until Element Is Visible    ${MAINTENANCE_CARD}    15 sec    error = 'Maintenance' widget is not displayed on the 'Service Details' page!
    Wait Until Element Is Visible    ${DATABASE_CONFIGURATION_CARD}    15 sec    error = 'Database Configuration' widget is not displayed on the 'Service Details' page!

    