*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PREPROD_URL}    https://app-test.skysql.com/login
${USERNAME}       akshay+test@skysql.com
${PASSWORD}       Test@123

*** Test Cases ***
Test Login PP
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    css=button[data-action-button-primary='true']    timeout=10s
    Click Button    css=button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=.v-list-item--link    timeout=30s
    Click Element    xpath=(//div[contains(@class, 'v-list-item--link')])[5]
    Wait Until Page Contains Element    id=copilot-messages    timeout=30s
    Input Text    css=textarea[placeholder]    Hello World!
    Sleep    5s
    Close Browser

Test Logout PP
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    css=button[data-action-button-primary='true']    timeout=10s
    Click Button    css=button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=[data-test-id='btn-user-menu-action']    timeout=5s
    Click Element    css=[data-test-id='btn-user-menu-action']
    Click Element    css=[data-test-id='user-menu-item-logout']
    Wait Until Page Contains Element    id=username    timeout=10s
    Close Browser

Test Prompts
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    css=button[data-action-button-primary='true']    timeout=10s
    Click Button    css=button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=.v-list-item--link    timeout=30s
    Click Element    xpath=(//div[contains(@class, 'v-list-item--link')])[5]
    Wait Until Page Contains Element    id=copilot-messages    timeout=30s
    Input Text    css=textarea[placeholder]    Hello World!
    Click Button    css=[data-test-id='btn-send-prompt']
    Wait Until Page Contains Element    css=[data-test-id='btn-user-menu-action']    timeout=5s
    Click Element    css=[data-test-id='btn-user-menu-action']
    Click Element    css=[data-test-id='user-menu-item-logout']
    Wait Until Page Contains Element    id=username    timeout=10s
    Close Browser

Test No Services
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    css=button[data-action-button-primary='true']    timeout=10s
    Click Button    css=button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=.my-5    timeout=30s
    ${text}=    Get Text    css=.my-5
    Should Be Equal As Strings    ${text}    You don’t have any SkySQL services right now.
    Close Browser

Test Create Service
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Wait Until Element Is Visible    css=button[data-action-button-primary='true']    timeout=10s
    Click Button    css=button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=.my-5    timeout=30s
    ${text}=    Get Text    css=.my-5
    Should Be Equal As Strings    ${text}    You don’t have any SkySQL services right now.
    Click Element    css=.launch-btn
    Wait Until Page Contains Element    css=.row    timeout=10s
    ${headline}=    Get Text    css=.view-headline
    Should Be Equal As Strings    ${headline}    Launch a Cloud Database
    Close Browser