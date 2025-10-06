*** Settings ***

Documentation    Query Editor Tab Page Keywords
Library          SeleniumLibrary
Library          String

*** Variables ***

${QUERY_EDITOR_TAB_LINK} =                    xpath = //*[contains(text(), 'Query Editor')]
${CONNECTED_SUCCESSFULLY_POPUP} =             xpath = //*[contains(text(), 'Connected successfully')]//..//..//..//..//..//..//*[contains(@class, 'v-snack--active')]
${QUERY_EDITOR_EXPLORE_BUTTON} =              xpath = //button//*[contains(text(), 'Explore')]
${QUERY_EDITOR_MENU_ARROW} =                  xpath = //*[@class='v-input__append-inner']
${QUERY_EDITOR_DROPDOWN_LIST} =               xpath = //*[@role='listbox']
${SERVICE_NAME_VALUE} =                       xpath = //*[@role='listbox']//*[contains(text(), '{}')]

*** Keywords ***

Click on the 'Query Editor' tab
    [Documentation]    Click on the 'Query Editor' tab

    wait until element is visible    ${QUERY_EDITOR_TAB_LINK}    30 sec    error = 'Query Editor' tab is not displayed on the 'Service Details' page!
    click element    ${QUERY_EDITOR_TAB_LINK}

    log to console    Click on the 'Query Editor' tab

Verify the service is connected successfully
    [Documentation]    Verify the service is connected successfully

    wait until element is visible    ${CONNECTED_SUCCESSFULLY_POPUP}    45 sec    error = 'Connected successfully' popup is not displayed on the 'Service Query Editor' page!

    log to console    Verify the service is connected successfully

Verify 'Query Editor' tab is missing for Standalone
    [Documentation]    Verify 'Query Editor' tab is missing for Standalone

    wait until page does not contain element    ${QUERY_EDITOR_TAB_LINK}    30 sec    error = 'Query Editor' tab is displayed on the 'Service Details' page!

    log to console    Verify Query Editor tab is missing for Standalone

Navigate to 'Workspace / Query Editor' page
    [Documentation]    Navigate to 'Workspace / Query Editor' page

    wait until element is visible    ${QUERY_EDITOR_EXPLORE_BUTTON}    30 sec    error = 'Explore' button is not displayed on the 'Workspace' page!
    click element    ${QUERY_EDITOR_EXPLORE_BUTTON}

    log to console    Navigate to 'Workspace / Query Editor' page

Choose value from the 'Query Editor' dropdown
    [Documentation]    Choose ${TOPOLOGY_NAME_VALUE} from the 'Query Editor' dropdown
    [Arguments]    ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${QUERY_EDITOR_MENU_ARROW}    15 sec    error = 'Query Editor' menu arrow is not displayed on the 'Workspace/Query Editor' page!
    click element    ${QUERY_EDITOR_MENU_ARROW}

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${formatted_service_name_value_locator} =    format string    ${SERVICE_NAME_VALUE}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_service_name_value_locator}    15 sec    error = The service is not displayed on the 'Query Editor' dropdown menu!
    click element    ${formatted_service_name_value_locator}

    log to console    Choose from the 'Query Editor' dropdown - ${TOPOLOGY_NAME_VALUE}
