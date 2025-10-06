*** Settings ***
Documentation    Configuration Manager Details Page Keywords
Library          SeleniumLibrary
Library          String
Library          ExcelLibrary
Library          Collections
Resource         ../../../TestData/VerificationStrings.robot


*** Variables ***

${BACK_ARROW_BUTTON}                                    xpath = //*[contains(@class, 'expand-arrow')]
${SERVICES_WITH_THIS_CONFIGURATION_ENTRY}               xpath = //*[contains(text(), 'Services with this configuration')]//..//*[contains(text(), '{}')]
${CUSTOM_CONFIGURATION_PAGE_TITLE}                      xpath = //*[contains(@class, 'expand-arrow')]//..//..//*
${ACTIONS_DROPDOWN}                                     xpath = //*[contains(text(), 'Actions')]
${EDIT_ACTION_LABEL}                                    xpath = //*[(text()= 'Edit')]
${DUPLICATE_ACTION_LABEL}                               xpath = //*[(text()= 'Duplicate')]
${CONFIG_VARIABLE_1_SELECTED_VALUE}                     xpath = //tr[contains(., '${CONFIG_VARIABLE_1}')]//*[contains(text(), '${CONFIG_VARIABLE_1_VALUE}')]
${CONFIG_VARIABLE_2_SELECTED_VALUE}                     xpath = //tr[contains(., '${CONFIG_VARIABLE_2}')]//*[contains(text(), '${CONFIG_VARIABLE_2_VALUE}')]

*** Keywords ***

Compare newly entered config name with the saved one are the same
    [Documentation]    Compare newly entered config name with the saved one are the same

    # ${NEW_CONFIGURATION_NAME_VALUE} is a test variable taken from 'NewDatabaseConfigurationKeywords.Input configuration name'
    wait until keyword succeeds    3x   30 sec    element text should be    ${CUSTOM_CONFIGURATION_PAGE_TITLE}    Settings / Configuration Manager / ${NEW_CONFIGURATION_NAME_VALUE}
    ...    error = The newly entered config name and the saved one are NOT the same!

    log to console    Verify the current config name is '${NEW_CONFIGURATION_NAME_VALUE}'

Click on the back arrow button
    [Documentation]    Click the back arrow button

    wait until element is visible    ${BACK_ARROW_BUTTON}    5 sec    error = Back arrow button is not displayed on the 'Configuration Manager Detail' page!
    click element    ${BACK_ARROW_BUTTON}

    set test variable    ${BACK_ARROW_BUTTON}

    log to console    Click on the back arrow button

Verify the 'services with this configuration' section contains the topology name
    [Documentation]    Verify the 'services with this configuration' section of the applied custom config contains the topology name

    # ${TOPOLOGY_NAME_VALUE} variable is set in LaunchServiceDetailsKeywords.Input 'Service Name'
    ${formatted_locator_services_with_this_configuration_entry} =    format string    ${SERVICES_WITH_THIS_CONFIGURATION_ENTRY}    ${TOPOLOGY_NAME_VALUE}

    wait until element is visible    ${formatted_locator_services_with_this_configuration_entry}    15 sec
    ...    error = '${TOPOLOGY_NAME_VALUE}' is not displayed on the 'Configuration Manager Detail' page!

    log to console    Verify the 'services with this configuration' section contains the topology name

Click the Actions dropdown
    [Documentation]    Click on the Actions dropdwon button

    wait until element is visible    ${ACTIONS_DROPDOWN}    15 sec    error = Actions dropdown is not displayed on the 'Configuration Manager Detail' page!
    click element    ${ACTIONS_DROPDOWN}

    log to console    Click the Actions dropdown

Select Edit label
    [Documentation]    Click on the Edit label from the Actions dropdown

    wait until element is visible    ${EDIT_ACTION_LABEL}    15 sec    error = Edit is not displayed on the 'Configuration Manager Detail' page!
    click element    ${EDIT_ACTION_LABEL}    action_chain=True

    log to console    Select Edit label

Select Duplicate label
    [Documentation]    Click on the Duplicate label from the Actions dropdown

    wait until element is visible    ${DUPLICATE_ACTION_LABEL}    15 sec    error = Duplicate is not displayed on the 'Configuration Manager Detail' page!
    click element    ${DUPLICATE_ACTION_LABEL}    action_chain=True

    log to console    Select Duplicate label

Verify config Edit changes are successfully saved
    [Documentation]    Verify config Edit changes are successfully saved
    [Arguments]    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}    ${CONFIG_VARIABLE_1_VALUE}    ${CONFIG_VARIABLE_2_VALUE}

    wait until page contains         ${EDITTED_CONFIGURATION_NAME_VALUE}    15 sec     error = Editted config name is not displayed/set correctly on the 'Configuration Manager Detail' page!
    wait until element is visible    ${CONFIG_VARIABLE_1_SELECTED_VALUE}    15 sec     error = '${CONFIG_VARIABLE_1_VALUE}' is not displayed/set correctly on the 'Configuration Manager Detail' page!
    wait until element is visible    ${CONFIG_VARIABLE_2_SELECTED_VALUE}    15 sec     error = '${CONFIG_VARIABLE_2_VALUE}' is not displayed/set correctly on the 'Configuration Manager Detail' page!

    log to console    Verify config Edit changes are successfully saved

Verify the duplicated config is correctly displayed
    [Documentation]    The title of the page should match the name of the duplicated config

    wait until keyword succeeds    3x   15 sec    element text should be    ${CUSTOM_CONFIGURATION_PAGE_TITLE}    Settings / Configuration Manager / Copied_${NEW_CONFIGURATION_NAME_VALUE}
    ...    error = The duplicated config name is not correctly displayed!

    log to console    Verify the duplicated config is correctly displayed
