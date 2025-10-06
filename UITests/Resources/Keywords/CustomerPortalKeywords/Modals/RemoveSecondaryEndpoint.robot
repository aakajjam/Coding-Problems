*** Settings ***

Documentation    Remove secondary endpoint page keywords
Library          SeleniumLibrary
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${REMOVE_SECONDARY_ENDPOINT_MODAL} =       xpath = //*[contains(@class, 'v-dialog--active')]
${REMOVE_SECONDARY_ENDPOINT_BUTTON} =      xpath = //*[@type='button']//*[contains(text(),'Remove')]

*** Keywords ***

Verify page title is 'Remove secondary endpoint'
    [Documentation]    Check the page title is 'Remove secondary endpoint'

    wait until element is visible    ${REMOVE_SECONDARY_ENDPOINT_MODAL}    30s    error = 'Remove secondary endpoint' modal is not visible on the Details page!

    # ${REMOVE_SECONDARY_ENDPOINT_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${REMOVE_SECONDARY_ENDPOINT_MODAL}    ${REMOVE_SECONDARY_ENDPOINT_EXPECTED_TITLE}    msg = 'Remove Secondary endpoint expected title' is not displayed on the 'Remove secondary endpoint' modal!

    log to console    Verify page title is 'Remove secondary endpoint'

Click 'Remove' button
    [Documentation]    Click the 'Remove' button in the Remove secondary endpoint modal

    wait until element is visible    ${REMOVE_SECONDARY_ENDPOINT_BUTTON}    15s    error = 'Remove' button is not displayed on the 'Remove secondary endpoint' page!
    click element    ${REMOVE_SECONDARY_ENDPOINT_BUTTON}    action_chain=True

    log to console    Click 'Remove' button
