*** Settings ***

Documentation    Sign in Keywords
Library          SeleniumLibrary
Resource          ../../../TestData/VerificationStrings.robot

*** Variables ***

${SIGN_IN_TITLE} =         xpath = //h3[contains(text(),'Sign-in')]
${PASSWORD_INPUT_FIELD} =  id = id_password
${NEXT_BUTTON} =           xpath = //input[@value='Next']

*** Keywords ***

Verify page title is 'Sign-in'
    [Documentation]    Check the page title is 'Sign-in'

    wait until element is visible    ${SIGN_IN_TITLE}  15s  error = 'Sign-in' title is not displayed!

    # ${SIGN_IN_EXPECTED_TITLE} variable is coming from Utils -> VerificationStrings.robot
    title should be  ${SIGN_IN_EXPECTED_TITLE}

    log to console  Verify page title is 'Sign-in'

Populate 'Password'
    [Documentation]    Populate 'Password'
    [Arguments]     ${PASSWORD}

    input password  ${PASSWORD_INPUT_FIELD}    ${PASSWORD}

    log to console  Populate 'Password'

Click on 'Next' button
    [Documentation]    Click on the next button

    wait until keyword succeeds    2 min    5 sec   click button    ${NEXT_BUTTON}

    log to console    Click on 'Next' button
