*** Settings ***

Documentation    Sign up or Sign in page keywords
Library          SeleniumLibrary
Library          String
Resource          ../../../TestData/VerificationStrings.robot

*** Variables ***

${EMAIL_ADDRESS_INPUT_FIELD} =  id = username
${PASSWORD_INPUT_FIELD} =       id = password
${CONTINUE_BUTTON} =            xpath = //button[text()='Continue' and @data-action-button-primary='true']
${SIGN_UP_OR_SIGN_IN_TITLE} =   xpath = //p[text()='Log in to SkySQL to continue']

*** Keywords ***

Navigate to Customer Portal
    [Documentation]    Navigate to portal UI
    [Arguments]   ${ENV}

    Go to  ${PORTAL_SKYSQL_URLS.${ENV}}

    log to console  Navigate to Customer Portal

Verify page title is 'Login - SkySQL'
    [Documentation]    Verify page title is 'Sign up or Sign in'

    wait until element is visible    ${SIGN_UP_OR_SIGN_IN_TITLE}  15s    error = 'Sign up or Sign in' page is not displayed!

    # ${SIGN_UP_OR_SIGN_IN_EXPECTED_TITLE} variable is coming from Utils -> VerificationStrings.robot
    title should be    ${SIGN_UP_OR_SIGN_IN_EXPECTED_TITLE}

    log to console  Verify page title is 'Login - SkySQL'

Populate 'Email'
    [Documentation]    Populate 'Email'
    [Arguments]   ${USERNAME}

    input text    ${EMAIL_ADDRESS_INPUT_FIELD}  ${USERNAME}

    log to console    Populate 'Email'

Populate 'Password'
    [Documentation]    Populate 'Password'
    [Arguments]     ${PASSWORD}

    input password  ${PASSWORD_INPUT_FIELD}    ${PASSWORD}

    log to console  Populate 'Password'

Click on 'Continue' button
    [Documentation]    Click on 'Continue' button

    click button    ${CONTINUE_BUTTON}

    log to console    Click on 'Continue' button
