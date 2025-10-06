*** Settings ***

Documentation    Delete Service Page Keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${DELETE_PAGE_TITLE} =  xpath = //div[contains(text(),'Delete {}')]
${DELETE_INPUT} =       xpath = //div[@class='v-text-field__slot']//input[@placeholder='Type in "delete" here']
${YES_DELETE_BUTTON} =  xpath = //form[@class='v-form']//span[contains(text(),'Yes, delete')]
${SUBMIT_BUTTON} =      xpath = //button[@id='submit-modal']

*** Keywords ***

Verify page title is 'Delete'
    [Documentation]    Check the page title is 'Delete ${TOPOLOGY_NAME_VALUE}'

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${formatted_locator_delete} =  Format String  ${DELETE_PAGE_TITLE}  ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_delete}  15s  error = 'Delete ${TOPOLOGY_NAME_VALUE}' page is not displayed!
    ${delete_page_actual_title} =  get text    ${formatted_locator_delete}

    # ${DELETE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    should contain any     ${delete_page_actual_title}  ${DELETE_EXPECTED_TITLE}

    log to console  Verify page title is 'Delete ${TOPOLOGY_NAME_VALUE}'

Verify page title is 'Delete', service 2
    [Documentation]    Check the page title is 'Delete ${SECOND_TOPOLOGY_NAME_VALUE}', service 2

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> Input second 'service name'
    ${formatted_locator_delete} =  Format String  ${DELETE_PAGE_TITLE}  ${SECOND_TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_delete}  15s  error = 'Delete ${SECOND_TOPOLOGY_NAME_VALUE}' page is not displayed!
    ${delete_page_actual_title} =  get text    ${formatted_locator_delete}

    # ${DELETE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    should contain any     ${delete_page_actual_title}  ${DELETE_EXPECTED_TITLE}

    log to console  Verify page title is 'Delete ${SECOND_TOPOLOGY_NAME_VALUE}', service 2

Input 'delete' text and click 'Yes, delete'
    [Documentation]    Enter delete and click submit for a topology

    wait until page contains element    ${DELETE_INPUT}     30s    error = Delete input field is not displayed!
    click element  ${DELETE_INPUT}
    # ${DELETE_INPUT_TEXT_VALUE} variable is passed from 'VerificationStrings.robot' file
    input text    ${DELETE_INPUT}  ${DELETE_INPUT_TEXT_VALUE}
    click element  ${YES_DELETE_BUTTON}

    log to console    Input delete text and click 'Yes, delete'

Input delete text and click submit for configuration
    [Documentation]    Enter delete and click submit for a configuration

    wait until element is visible    ${DELETE_INPUT}     30s    error = Delete input field is not displayed!
    input text    ${DELETE_INPUT}     delete
    click button    ${SUBMIT_BUTTON}

    log to console    Input delete text and click submit for configuration
