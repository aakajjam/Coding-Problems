*** Settings ***

Documentation    Leave Query editor page keywords
Library          SeleniumLibrary
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

# ${LEAVE_QUERY_EDITOR_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
${LEAVE_QUERY_EDITOR_MODAL_TITLE} =     xpath = //*[contains(@class, 'v-card__title')]//*[contains(text(), '${LEAVE_QUERY_EDITOR_EXPECTED_TITLE}')]
${CONFIRM_BUTTON} =                     xpath = //*[contains(text(),'Confirm')]

*** Keywords ***

Verify modal title is 'Are you sure you want to leave?'
    [Documentation]    Check the modal title is 'Are you sure you want to leave?'

    wait until element is visible    ${LEAVE_QUERY_EDITOR_MODAL_TITLE}    30s    error = Leave Query editor modal is not visible!

    log to console    Verify modal title is 'Are you sure you want to leave?'

Disconnect all services
    [Documentation]    Disconnect all services

    wait until element is visible    ${CONFIRM_BUTTON}    15s    error = 'Confirm' button is not displayed on the Leave Query editor modal!
    click element    ${CONFIRM_BUTTON}    action_chain=True

    log to console    Disconnect all services
