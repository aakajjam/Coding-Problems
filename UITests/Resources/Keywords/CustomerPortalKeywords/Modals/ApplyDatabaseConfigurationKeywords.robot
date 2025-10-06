*** Settings ***

Documentation    'Apply database configuration' modal keywords
Library    SeleniumLibrary
Library    String

*** Variables ***

${APPLY_DB_CONFIG_BUTTON}                   xpath = //button//*[contains(text(), 'Apply database configuration')]
${AUTOMATED_TEST_CONFIG_OPTION}             xpath = //*[text() = ' {} ']//..//..//..//*[contains(@class, 'radiobox')]

*** Keywords ***

Select the newly created configuration
    [Documentation]    Select the newly created configuration

    # ${NEW_CONFIGURATION_NAME_VALUE} is taken from 'NewDatabaseConfigurationKeywords.Input configuration name'
    ${automated_test_config_option_formatted} =    format string    ${AUTOMATED_TEST_CONFIG_OPTION}    ${NEW_CONFIGURATION_NAME_VALUE}
    wait until element is visible    ${automated_test_config_option_formatted}  5s    error = The configuration label is not displayed on the 'Apply database configuration' page!

    wait until keyword succeeds    3x    1s    click element    ${automated_test_config_option_formatted}    action_chain=True

    log to console    Select the newly created configuration - ${NEW_CONFIGURATION_NAME_VALUE}

Select the desired configuration
    [Documentation]    Select the desired configuration
    [Arguments]    ${CONFIG_NAME}

    ${automated_test_config_option_formatted} =    format string    ${AUTOMATED_TEST_CONFIG_OPTION}    ${CONFIG_NAME}
    wait until element is visible    ${automated_test_config_option_formatted}  5s    error = The configuration label is not displayed on the 'Apply database configuration' page!

    wait until keyword succeeds    3x    1s    click element    ${automated_test_config_option_formatted}    action_chain=True

    log to console    Select the desired configuration - ${CONFIG_NAME}

Click on 'Apply database configuration' button
    [Documentation]    Click on 'Apply database configuration' button

    wait until element is visible    ${APPLY_DB_CONFIG_BUTTON}  5s    error = 'Apply database configuration' button is not displayed on the 'Apply database configuration' page!

    click element    ${APPLY_DB_CONFIG_BUTTON}

    log to console    Click on 'Apply database configuration' button

    # This wait time is required in order for the 'db configure' process to finish
    sleep    120
