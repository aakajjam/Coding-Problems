*** Settings ***

Documentation    'Duplicate {CONFIGURATION_NAME}' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${DUPLICATE_CONFIG_MODAL} =            xpath = //*[contains(@class, 'v-dialog--active')]
${CANCEL_BUTTON} =                     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Cancel')]
${DUPLICATE_BUTTON} =                  xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Duplicate')]
${DUPLICATED_CONFIG_NAME_INPUT} =      xpath = //*[contains(@class, 'v-dialog--active')]//input

*** Keywords ***

Verify page title is 'Duplicate {CONFIGURATION_NAME}'
    [Documentation]    Verify page title is 'Duplicate {CONFIGURATION_NAME}'

    wait until element is visible    ${DUPLICATE_CONFIG_MODAL}    15s    error = 'Duplicate {CONFIGURATION_NAME}' modal is not visible!

    # ${NEW_CONFIGURATION_NAME_VALUE} variable is passed from 'NewDatabaseConfigurationKeywords.robot->Input configuration name'
    element should contain    ${DUPLICATE_CONFIG_MODAL}    Duplicate ${NEW_CONFIGURATION_NAME_VALUE}

    log to console    Verify page title is 'Duplicate ${NEW_CONFIGURATION_NAME_VALUE}'

Click 'Duplicate' button
    [Documentation]    Click 'Duplicate' button

    wait until element is visible    ${DUPLICATE_BUTTON}    15s    error = 'Duplicate' button is not visible on the 'Duplicate {CONFIGURATION_NAME}' page!
    click element    ${DUPLICATE_BUTTON}

    log to console    Click 'Duplicate' button

Input name of the duplicated config
    [Documentation]    Input a new name for the duplicated configuration

    wait until element is visible    ${DUPLICATED_CONFIG_NAME_INPUT}    15s    error = 'Input' field is not visible on the 'Duplicate {CONFIGURATION_NAME}' page!
    # Delete everything in the input box, both for standard/Windows keyboard and Mac keyboard.
    press keys    ${DUPLICATED_CONFIG_NAME_INPUT}    CTRL+A    COMMAND+A    BACKSPACE    Copied_${NEW_CONFIGURATION_NAME_VALUE}

    log to console    Input name of the duplicated config
