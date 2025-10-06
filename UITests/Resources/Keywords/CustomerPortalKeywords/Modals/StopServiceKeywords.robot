*** Settings ***

Documentation    'Stop Service' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${STOP_SERVICE_MODAL} =                xpath = //*[contains(@class, 'v-dialog--active')]
${YES_STOP_THIS_SERVICE_BUTTON} =      xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(text(), 'Yes, Stop this Service')]

*** Keywords ***

Verify page title is 'Stop service'
    [Documentation]    Check the page title is 'Stop service'

    wait until element is visible    ${STOP_SERVICE_MODAL}    30s    error = 'Stop service' modal is not visible!

    # ${STOP_SERVICE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${STOP_SERVICE_MODAL}    ${STOP_SERVICE_EXPECTED_TITLE}

    log to console    Verify page title is 'Stop service'

Click "Stop this Service" Button
    [Documentation]    Click the 'Yes, Stop this Service' Button in the stop service modal

    wait until element is visible    ${YES_STOP_THIS_SERVICE_BUTTON}    15s    error = 'Yes, Stop this Service' is not displayed on the 'Stop service' page!
    click element    ${YES_STOP_THIS_SERVICE_BUTTON}    action_chain=True

    log to console    Click "Stop this Service" Button
