*** Settings ***
Documentation    New Database Configuration Page Keywords
Library          SeleniumLibrary
Library          String
Library          ExcelLibrary
Library          Collections
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../../Utils/Helpers.robot

*** Variables ***

${NEW_DATABASE_CONFIGURATION_PAGE_TITLE}    xpath = //*[contains(@class, 'expand-arrow')]//..//..//*
${NAME_INPUT}                               xpath = //*[contains(text(), 'Name')]//..//*[@class= 'v-text-field__slot']/input
${TOPOLOGY_DROPDOWN}                        xpath = //*[@placeholder= 'Select a Topology']
${TOPOLOGY_LIST}                            xpath = //*[@role= 'option' and text()=' {} ']
${SERVER_VERSION_DROPDOWN}                  xpath = //*[@class='ml-2 server-version']//..//*[@placeholder= 'Select a version']
${SERVER_VERSION_LIST}                      xpath = //*[@class='ml-2 server-version']//*[@role='listbox']
${SERVER_VERSION_VALUE}                     xpath = //*[@class='ml-2 server-version']//*[contains(text(), '${CONFIG_SERVER_VERSION}')]
${SAVE_CONFIGURATION_BUTTON}                xpath = //*[contains(text(), 'Save')]
${RESET_TO_DEFAULTS_BUTTON}                 xpath = //*[contains(text(), 'Reset to defaults')]
${THIRD_VARIABLE_VALUE_DROPDOWN}            xpath = //tr[3]//td[3]//..//*[@class='v-select__selections']
${THIRD_VARIABLE_NEW_VALUE_DROPDOWN}        xpath = (//tr[3]//td[3]//..//*[@aria-selected='false'])[1]
${CONFIG_VARIABLE_1_VALUE_DROPDOWN}         xpath = //tr[contains(., '${CONFIG_VARIABLE_1}')]//*[@role= 'button']
${CONFIG_VARIABLE_2_VALUE_DROPDOWN}         xpath = //tr[contains(., '${CONFIG_VARIABLE_2}')]//*[@role= 'button']
${CONFIG_VARIABLE_1_VALUE_SELECTION}        xpath = //tr[contains(., '${CONFIG_VARIABLE_1}')]//*[text()= '${CONFIG_VARIABLE_1_VALUE}']
${CONFIG_VARIABLE_2_VALUE_SELECTION}        xpath = //tr[contains(., '${CONFIG_VARIABLE_2}')]//*[text()= '${CONFIG_VARIABLE_2_VALUE}']
${THIRD_VARIABLE_NAME}                      xpath = (//*[contains(@class, 'v-icon__component theme--light primary--text')])[3]//..//..//..//..//td[1]
${SEARCH_FIELD_INPUT}                       xpath = //input[@placeholder = 'Search']
${SEARCH_RESULT_VARIABLE_NAME}              xpath = (//*[contains(@class, 'v-icon__component theme--light primary--text')])[1]//..//..//..//..//td[1]

*** Keywords ***

Verify the page title is 'New Database Configuration'
    [Documentation]    Verify the page title is 'New Database Configuration'

    wait until element is visible     ${NEW_DATABASE_CONFIGURATION_PAGE_TITLE}    15s    error = 'New Database Configuration' text is not displayed on the 'New Database Configuration' page!
    ${new_database_configuration_page_actual_title} =  get text  ${NEW_DATABASE_CONFIGURATION_PAGE_TITLE}
    should be equal as strings    ${new_database_configuration_page_actual_title}    ${NEW_DATABASE_CONFIGURATION_PAGE_EXPECTED_TITLE}    msg = Page title should be: ${NEW_DATABASE_CONFIGURATION_PAGE_EXPECTED_TITLE}, but is: ${NEW_DATABASE_CONFIGURATION_PAGE_TITLE}

    log to console    Verify the page title is 'New Database Configuration'

Input configuration name
    [Documentation]    Input a unique name of the newly created configuration.

    ${timestamp} =  Get Current Date  local  exclude_millis=yes  result_format=%dd%mm%yy-%Hh%Mm%Ss
    ${NEW_CONFIGURATION_NAME_VALUE} =    set variable    ${TEST_NAME}[:30]_${timestamp}
    wait until element is visible     ${NAME_INPUT}    5s    error = 'Name' input field is not displayed on the 'New Database Configuration' page!
    # Delete everything in the input box, both for standard/Windows keyboard and Mac keyboard.
    press keys    ${NAME_INPUT}    CTRL+A    COMMAND+A    BACKSPACE    ${NEW_CONFIGURATION_NAME_VALUE}

    set test variable    ${NEW_CONFIGURATION_NAME_VALUE}

    log to console    Input configuration name - '${NEW_CONFIGURATION_NAME_VALUE}'.

Input eddited config name
    [Documentation]    Input a changed name for the config being editted.

    wait until element is visible     ${NAME_INPUT}    15s    error = 'Name' input field is not displayed on the 'New Database Configuration' page!

    ${EDITTED_CONFIGURATION_NAME_VALUE} =    set variable    ${NEW_CONFIGURATION_NAME_VALUE}_EDITTED
    press keys    ${NAME_INPUT}    CTRL+A    COMMAND+A    BACKSPACE    ${EDITTED_CONFIGURATION_NAME_VALUE}

    set test variable    ${EDITTED_CONFIGURATION_NAME_VALUE}

    log to console    Input eddited config name

Select a 'topology'
    [Documentation]    Select 'topology' dropdown
    [Arguments]    ${default_topology_name}

    wait until element is visible     ${TOPOLOGY_DROPDOWN}    15s    error = Select a toplogy dropdown is not displayed on the 'New Database Configuration' page!
    click element    ${TOPOLOGY_DROPDOWN}

    # The below variable takes the value for the ${default_topology_name} key from the ${TOPOLOGY_DEFAULT_CONFIG_DICT} and trims it.
    # ${TOPOLOGY_DEFAULT_CONFIG_DICT} is taken from 'Resources/TestData/VerificationStrings.robot' and
    # ${default_topology_name} is passed from the arguments file.
    ${topology_selected_name_congfig_manager}    Set Variable    ${TOPOLOGY_DEFAULT_CONFIG_DICT}[${default_topology_name}][17:]
    ${formatted_locator_select_topology_from_list} =  Format String    ${TOPOLOGY_LIST}    ${topology_selected_name_congfig_manager}
    wait until element is visible     ${formatted_locator_select_topology_from_list}   15s    error = List with config topologies is not displayed on the 'New Database Configuration' page!
    click element    ${formatted_locator_select_topology_from_list}

    log to console    Select a topology - '${topology_selected_name_congfig_manager}'

Select 'server version'
    [Documentation]    Select 'server version' dropdown
    [Arguments]    ${config_server_version}

    wait until element is visible     ${SERVER_VERSION_DROPDOWN}    15s    error = 'Server version' dropdown is not displayed on the 'New Database Configuration' page!
    click element    ${SERVER_VERSION_DROPDOWN}

    wait until element is visible    ${SERVER_VERSION_LIST}    15s    error = 'Server version' list is not displayed on the 'New Database Configuration' page!
    wait until element is visible    ${SERVER_VERSION_VALUE}    5s    error = 'Server version' value is not displayed on the 'New Database Configuration' page!
    click element    ${SERVER_VERSION_VALUE}

    log to console    Select 'server version' - ${config_server_version}

Set new variable values
    [Documentation]    Set new values for the config variables set in the .args file
    [Arguments]    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}    ${CONFIG_VARIABLE_1_VALUE}    ${CONFIG_VARIABLE_2_VALUE}

    wait until element is visible    ${CONFIG_VARIABLE_1_VALUE_DROPDOWN}    15 sec    error = '${CONFIG_VARIABLE_1}' variable dropdown is not displayed on the 'New Database Configuration' page!
    click element    ${CONFIG_VARIABLE_1_VALUE_DROPDOWN}
    wait until element is visible    ${CONFIG_VARIABLE_1_VALUE_SELECTION}    15 sec    error = '${CONFIG_VARIABLE_1_VALUE}' variable value is not displayed on the 'New Database Configuration' page!
    click element    ${CONFIG_VARIABLE_1_VALUE_SELECTION}

    wait until element is visible    ${CONFIG_VARIABLE_2_VALUE_DROPDOWN}    15 sec    error = '${CONFIG_VARIABLE_2}' variable dropdown is not displayed on the 'New Database Configuration' page!
    click element    ${CONFIG_VARIABLE_2_VALUE_DROPDOWN}
    wait until element is visible    ${CONFIG_VARIABLE_2_VALUE_SELECTION}    15 sec    error = '${CONFIG_VARIABLE_2_VALUE}' variable value is not displayed on the 'New Database Configuration' page!
    click element    ${CONFIG_VARIABLE_2_VALUE_SELECTION}

    log to console    Set new variable values

Click on the 'Save' button to create new configuration
    [Documentation]    Click on the 'Save' button to create new configuration

    wait until element is visible    ${SAVE_CONFIGURATION_BUTTON}    15 sec    error = 'Save' button is not displayed on the 'New Database Configuration' page!
    click element    ${SAVE_CONFIGURATION_BUTTON}

    log to console    Click on the 'Save' button to create new configuration

Click on the back arrow button
    [Documentation]    Click the back arrow button

    # ${BACK_ARROW_BUTTON} is taken from 'ConfigurationManagerDetailKeywords.Click on the back arrow button'
    wait until element is visible    ${BACK_ARROW_BUTTON}    5 sec    error = Back arrow button is not displayed on the 'New Database Configuration' page!
    click element    ${BACK_ARROW_BUTTON}

    log to console    Click on the back arrow button

Get the third variable value
    [Documentation]    Get the third variable value

    wait until element is visible    ${THIRD_VARIABLE_VALUE_DROPDOWN}    15 sec    error = Third variable value selection dropdown is not displayed on the 'New Database Configuration' page!
    ${THIRD_VARIABLE_INITIAL_VALUE} =    get text    ${THIRD_VARIABLE_VALUE_DROPDOWN}

    set test variable    ${THIRD_VARIABLE_INITIAL_VALUE}

    log to console    Get the third variable value - '${THIRD_VARIABLE_INITIAL_VALUE}'

Set new value of the third variable
    [Documentation]   Set new value of the third variable

    wait until element is visible    ${THIRD_VARIABLE_VALUE_DROPDOWN}    15 sec    error = Third variable value selection dropdown is not displayed on the 'New Database Configuration' page!
    click element    ${THIRD_VARIABLE_VALUE_DROPDOWN}

    wait until element is visible    ${THIRD_VARIABLE_NEW_VALUE_DROPDOWN}    15 sec    error = Third variable new value is not displayed on the 'New Database Configuration' page!
    click element    ${THIRD_VARIABLE_NEW_VALUE_DROPDOWN}

    # ${THIRD_VARIABLE_INITIAL_VALUE} is taken from 'Get the third variable value' keyword
    ${THIRD_VARIABLE_NEW_VALUE_TEXT} =    get text    ${THIRD_VARIABLE_VALUE_DROPDOWN}
    should not be equal as strings   ${THIRD_VARIABLE_INITIAL_VALUE}  ${THIRD_VARIABLE_NEW_VALUE_TEXT}

    log to console    Set new value of the third variable - '${THIRD_VARIABLE_NEW_VALUE_TEXT}'

Click on the 'Reset To Defaults' button
    [Documentation]    Click on the 'Reset To Defaults' button

    wait until element is visible    ${RESET_TO_DEFAULTS_BUTTON}    15 sec    error = 'Reset To Defaults' button is not displayed on the 'New Database Configuration' page!
    click element    ${RESET_TO_DEFAULTS_BUTTON}

    log to console    Click on the 'Reset To Defaults' button

Verify third variable value is reset to the initial one
    [Documentation]    Verify third variable value is reset to the initial one

    wait until element is visible    ${THIRD_VARIABLE_VALUE_DROPDOWN}    15 sec    error = Third variable value selection dropdown is not displayed on the 'New Database Configuration' page!

    ${Third_variable_current_value} =    get text    ${THIRD_VARIABLE_VALUE_DROPDOWN}

    # ${THIRD_VARIABLE_INITIAL_VALUE} is taken from 'Get the third variable value'
    should be equal as strings    ${Third_variable_current_value}    ${THIRD_VARIABLE_INITIAL_VALUE}

    log to console    Verify third variable value is reset to the initial one

Get the third variable name and store it
    [Documentation]    Get the third variable name and store it

    wait until element is visible    ${THIRD_VARIABLE_VALUE_DROPDOWN}    15 sec    error = Third variable value selection dropdown is not displayed on the 'New Database Configuration' page!
    ${third_variable_name_text} =    get text    ${THIRD_VARIABLE_NAME}

    set test variable    ${third_variable_name_text}

    log to console    Get the third variable name and store it - '${third_variable_name_text}'

Enter third variable name in the 'Search' field
    [Documentation]    In the 'Search' input field enter the Third variable name

    wait until element is visible    ${SEARCH_FIELD_INPUT}    5 sec    error = 'Search' input field is not displayed on the 'New Database Configuration' page!
    # ${third_variable_name_text} is taken from 'NewDatabaseConfigurationKeywords.Get the third variable name and store it'
    input text    ${SEARCH_FIELD_INPUT}    ${third_variable_name_text}

    log to console    Enter third variable name in the 'Search' field

Compare search result with the stored third variable value
    [Documentation]    Compare search result with the stored third variable value

    wait until element is visible    ${SEARCH_RESULT_VARIABLE_NAME}    15 sec    error = Third variable name is not displayed on the 'New Database Configuration' page!
    capture page screenshot
    ${third_variable_name_text_after_search} =    get text    ${SEARCH_RESULT_VARIABLE_NAME}

    # ${third_variable_name_text} is taken from 'NewDatabaseConfigurationKeywords.Get the third variable name and store it'
    should be equal as strings    ${third_variable_name_text_after_search}    ${third_variable_name_text}    msg = The stored variable name is not equal to the search result

    log to console    Compare search result with the stored third variable value
