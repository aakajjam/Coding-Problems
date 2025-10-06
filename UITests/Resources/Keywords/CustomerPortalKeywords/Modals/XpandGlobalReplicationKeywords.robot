*** Settings ***

Documentation    'Xpand Global Replication' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${XPAND_GLOBAL_REPLICATION_MODAL} =                 xpath = //*[contains(@class, 'v-dialog--active')]
${DIRECTION_SELECT_DROPDOWN} =                      xpath = (//*[contains(@placeholder, 'Select')])[1]
${SERVICE_SELECT_DROPDOWN} =                        xpath = //*[contains(@placeholder, 'Select')]
${DIRECTION_SELECT_VALUE} =                         xpath = //*[text()='Both Ways']
${SERVICE_SELECT_VALUE} =                           xpath = (//*[text()='{}'])[2]
${XPAND_GLOBAL_REPLICATION_SAVE_BUTTON} =           xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(text(), 'Save')]
${XPAND_GLOBAL_REPLICATION_SAVE_BUTTON_DISABLED} =  xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(., 'Save') and @disabled='disabled']
${XPAND_GLOBAL_REPLICATION_CANCEL_BUTTON} =         xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(text(), 'Cancel')]
${XPAND_GLOBAL_REPLICATION_SELECTED_SERVICE} =      xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(text(), '{}')]

*** Keywords ***

Verify page title is 'Set up Xpand Global Replication'
    [Documentation]    Check the page title is 'Set up Xpand Global Replication'

    wait until element is visible    ${XPAND_GLOBAL_REPLICATION_MODAL}    30s    error = 'Set up Xpand Global Replication' modal is not visible!

    # ${SET_UP_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${XPAND_GLOBAL_REPLICATION_MODAL}    ${SET_UP_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE}

    log to console    Verify page title is 'Set up Xpand Global Replication'

Verify page title is 'Edit Xpand Global Replication'
    [Documentation]    Check the page title is 'Edit Xpand Global Replication'

    wait until element is visible    ${XPAND_GLOBAL_REPLICATION_MODAL}    30s    error = 'Edit Xpand Global Replication' modal is not visible!

    # ${EDIT_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${XPAND_GLOBAL_REPLICATION_MODAL}    ${EDIT_XPAND_GLOBAL_REPLICATION_EXPECTED_TITLE}

    log to console    Verify page title is 'Edit Xpand Global Replication'

Select Direction for Xpand Replication
    [Arguments]    ${REPLICATION_DIRECTION}
    [Documentation]    Click the Direction dropdown and select Direction 'Both ways/To/From' for Xpand Replication.

    wait until element is visible    ${DIRECTION_SELECT_DROPDOWN}    30s    error = 'DIRECTION_SELECT_DROPDOWN' is not displayed on the 'Xpand Global Replication' page!
    click element    ${DIRECTION_SELECT_DROPDOWN}

    wait until element is visible    ${DIRECTION_SELECT_VALUE}    5s    error = 'DIRECTION_SELECT_VALUE' is not displayed on the 'Xpand Global Replication' page!
    click element    ${DIRECTION_SELECT_VALUE}

    log to console    Select Direction for Xpand Replication

Select Service for Xpand Replication
    [Documentation]    Click the Service dropdown and select Service for Xpand Replication.

    wait until element is visible    ${SERVICE_SELECT_DROPDOWN}    15s    error = 'SERVICE_SELECT_DROPDOWN' is not displayed on the 'Xpand Global Replication' page!
    click element    ${SERVICE_SELECT_DROPDOWN}

    # ${SECOND_TOPOLOGY_NAME_VALUE} is globally set variable in LaunchServiceDetailsKeywords.Input second 'service name'
    ${formatted_service_select_value} =    format string    ${SERVICE_SELECT_VALUE}    ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_service_select_value}    15s    error = 'SERVICE_SELECT_VALUE' is not displayed on the 'Xpand Global Replication' page!
    click element    ${formatted_service_select_value}    action_chain=True

    log to console    Select Service for Xpand Replication - ${SECOND_TOPOLOGY_NAME_VALUE}

Click Save Button for Xpand Replication
    [Documentation]    Click the Save Button in the Xpand Global Replication modal

    wait until element is visible    ${XPAND_GLOBAL_REPLICATION_SAVE_BUTTON}    15s    error = 'Save button' is not displayed on the 'Xpand Global Replication' page!
    click element    ${XPAND_GLOBAL_REPLICATION_SAVE_BUTTON}    action_chain=True

    log to console    Click Save Button for Xpand Replication

Click Cancel Button for Xpand Replication
    [Documentation]    Click the Cancel Button in the Xpand Global Replication modal

    wait until element is visible    ${XPAND_GLOBAL_REPLICATION_CANCEL_BUTTON}    15s    error = 'Cancel button' is not displayed on the 'Xpand Global Replication' page!
    click element    ${XPAND_GLOBAL_REPLICATION_CANCEL_BUTTON}    action_chain=True

    log to console    Click Cancel Button for Xpand Replication

Verify Save Button is disabled for Xpand Replication
    [Documentation]    Verify Save Button is disabled for Xpand Replication

    wait until element is visible    ${XPAND_GLOBAL_REPLICATION_SAVE_BUTTON_DISABLED}  15s    error = 'Save button' is not disabled on the 'Xpand Global Replication' page!

    log to console    Verify Save Button is disabled for Xpand Replication

Verify replication is correctly displayed for the 1st service
    [Documentation]    Verify replication is correctly displayed for the 1st service

    ${formatted_selected_service_locator} =    format string    ${XPAND_GLOBAL_REPLICATION_SELECTED_SERVICE}    ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_selected_service_locator}    30s    error = 'Selected Service' is not displayed on the 'Xpand Global Replication' page!

    log to console    Verify replication is correctly displayed for the 1st service

Verify replication is correctly displayed for the 2nd service
    [Documentation]    Verify replication is correctly displayed for the 2nd service

    ${formatted_selected_service_locator} =    format string    ${XPAND_GLOBAL_REPLICATION_SELECTED_SERVICE}    ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_selected_service_locator}    30s    error = 'Selected Service' is not displayed on the 'Xpand Global Replication' page!

    log to console    Verify replication is correctly displayed for the 2nd service
