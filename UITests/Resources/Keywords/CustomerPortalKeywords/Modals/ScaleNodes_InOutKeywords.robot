*** Settings ***

Documentation    'Scale Nodes' In/Out page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${SCALE_NODES_MODAL} =                 xpath = //*[contains(@class, 'v-dialog--active')]
${APPLY_CHANGES_BUTTON} =              xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes')]
${CANCEL_BUTTON} =                     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Cancel')]
${APPLY_CHANGES_BUTTON_DISABLED} =     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes') and @disabled='disabled']
${NODES_DRAGGED_ELEMENT} =             xpath = //*[contains(@class, 'v-dialog--active')]//*[@class='v-slider__thumb']
${NODES_CURRENT_VALUE} =               xpath = (//*[contains(@class, 'v-dialog--active')]//*[@data-auto='unit-label'])[1]

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

Select number of nodes
    [Documentation]     Select number of nodes
    [Arguments]    ${NODES_ALTERED}

    wait until element is visible    ${NODES_CURRENT_VALUE}    15 sec
    ${nodes_raw} =    get text    ${NODES_CURRENT_VALUE}
    ${nodes} =    set variable    ${nodes_raw}[-2]
    wait until element is visible    ${NODES_DRAGGED_ELEMENT}
    click element    ${NODES_DRAGGED_ELEMENT}

    WHILE    ${nodes} != ${NODES_ALTERED}    limit= 9
        press keys    None    ARROW_RIGHT
        ${nodes_raw} =    get text    ${NODES_CURRENT_VALUE}
        ${nodes} =    set variable    ${nodes_raw}[-2]
    END
    log to console    Select number of nodes: ${nodes}

Verify nodes number is correctly displayed
    [Arguments]    ${nodes_altered}
    [Documentation]    Verify nodes number is correctly displayed

    wait until page contains    (x${nodes_altered})    15s    error = 'Number of nodes' is not displayed on the 'Scale Nodes' page!

    log to console    Verify nodes number is correctly displayed
