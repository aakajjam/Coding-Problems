*** Settings ***

Documentation    'Scale Nodes' Up/Down page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${SCALE_NODES_MODAL} =                 xpath = //*[contains(@class, 'v-dialog--active')]
${APPLY_CHANGES_BUTTON} =              xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes')]
${CANCEL_BUTTON} =                     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Cancel')]
${APPLY_CHANGES_BUTTON_DISABLED} =     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes') and @disabled='disabled']
${INSTANCE_SIZE_VALUE_LABEL} =         xpath = //*[contains(@data-auto, 'manage-menucontent-instance')]/*[contains(., '{}')]
${CURRENT_INSTANCE_SIZE_VALUE}         xpath = //*[contains(@data-auto, 'billing-units')][1]

*** Keywords ***

Verify page title is 'Scale nodes'
    [Documentation]    Check the page title is 'Scale nodes'

    wait until element is visible    ${SCALE_NODES_MODAL}    15s    error = 'Scale nodes' modal is not visible!

    # ${SCALE_NODES_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${SCALE_NODES_MODAL}    ${SCALE_NODES_EXPECTED_TITLE}

    log to console    Verify page title is 'Scale nodes'

Click 'Apply changes' button
    [Documentation]    Click the 'Apply changes' button

    wait until element is visible    ${APPLY_CHANGES_BUTTON}    15s    error = 'Apply changes' button is not visible on the 'Scale Nodes' page!
    click element    ${APPLY_CHANGES_BUTTON}

    log to console    Click 'Apply changes' button

Click 'Cancel' button
    [Documentation]    Click 'Cancel' button

    wait until element is visible    ${CANCEL_BUTTON}    15s    error = 'Cancel' button is not visible on the 'Scale Nodes' page!
    click element    ${CANCEL_BUTTON}

    log to console    Click 'Cancel' button

Verify 'Apply changes' button is disabled
    [Documentation]    Verify 'Apply changes' button is disabled

    wait until element is visible    ${APPLY_CHANGES_BUTTON_DISABLED}    30 sec    error = 'Apply changes' button is still active or not visible on the 'Scale Nodes' page!

    log to console    Verify 'Apply changes' button is disabled

Select instance size in the scale nodes modal
    [Documentation]     Select instance size in the scale nodes modal
    [Arguments]    ${SIZE_ALTERED}

    ${formatted_locator_instance_size} =  Format String    ${INSTANCE_SIZE_VALUE_LABEL}    ${SIZE_ALTERED}
    wait until element is visible    ${formatted_locator_instance_size}    30 sec    error = 'Instance Size' is not displayed on the 'Scale Nodes' page!!
    click element    ${formatted_locator_instance_size}

    log to console     Select instance size in the scale nodes modal: ${SIZE_ALTERED}

Verify current instance size is correctly displayed
    [Arguments]    ${SIZE_ALTERED}
    [Documentation]    Verify current instance size is correctly displayed

    wait until element contains    ${CURRENT_INSTANCE_SIZE_VALUE}    ${SIZE_ALTERED}    15s    error = The current instance size is not correctly displayed on the 'Scale Nodes' page!

    log to console    Verify current instance size is correctly displayed
