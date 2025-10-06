*** Settings ***

Documentation    'Start Service' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${START_SERVICE_MODAL} =                xpath = //*[contains(@class, 'v-dialog--active')]
${YES_START_THIS_SERVICE_BUTTON} =      xpath = //*[contains(@class, 'v-dialog--active')]//*[contains(text(), 'Yes, Start this Service')]

*** Keywords ***

Verify page title is 'Start service'
    [Documentation]    Check the page title is 'Start service'

    wait until element is visible    ${START_SERVICE_MODAL}    30s    error = 'Start service' modal is not visible!

    # ${START_SERVICE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${START_SERVICE_MODAL}    ${START_SERVICE_EXPECTED_TITLE}

    log to console    Verify page title is 'Start service'

Click "Start this Service" Button
    [Documentation]    Click the 'Yes, Start this Service' Button in the stop service modal

    wait until element is visible    ${YES_START_THIS_SERVICE_BUTTON}    15s    error = 'Yes, Start this Service' is not displayed on the 'Stop service' page!
    click element    ${YES_START_THIS_SERVICE_BUTTON}    action_chain=True

    log to console    Click "Start this Service" Button
