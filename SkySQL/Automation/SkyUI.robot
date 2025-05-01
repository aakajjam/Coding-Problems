*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PREPROD_URL}    Give the URL here
${USERNAME}       Give username here
${PASSWORD}       Give password here

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
    Input Text    css=textarea[placeholder]    Get Connected
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

Test Create Service Serverless Fix
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    css:button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Capture Page Screenshot
    Wait Until Element Is Visible    css:.launch-btn    timeout=10s
    Click Element    css:.launch-btn
    #Wait Until Element Is Visible    xpath=//*[@id="app"]/div[1]/main/div/div/div/div[1]/div/div/div[1]/div[1]/button    timeout=20s
    #Click Element                    xpath=//*[@id="app"]/div[1]/main/div/div/div/div[1]/div/div/div[1]/div[1]/button
    Wait Until Element Is Visible    id=cloudProviderPanel    timeout=20s
    Scroll Element Into View    id=cloudProviderPanel
    Click Element    css:[data-test-id='btn-cloud-select-azure']
    Wait Until Element Is Visible    id=serverPanel    timeout=20s
    Scroll Element Into View    id=serverPanel
    Wait Until Element Is Visible    class=v-text-field__slot    timeout=20s
    Scroll Element Into View    class=v-text-field__slot
    ${SERVICE_NAME_TEXT}=    Get Text    class=v-text-field__slot
    Log    ${SERVICE_NAME_TEXT} 
    # Get this to print the text of the service name
    Wait Until Element Is Visible    css=.

    Sleep    5s
    Close Browser

Test Backups Tab
    Open Browser    ${PREPROD_URL}    Chrome
    Wait Until Page Contains Element    id=username    timeout=10s
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    css:button[data-action-button-primary='true']
    Wait Until Location Contains    dashboard    timeout=10s
    Log    Login successful!
    Wait Until Page Contains Element    css=.v-list-item--link    timeout=30s
    Click Element    xpath=(//div[contains(@class, 'v-list-item--link')])[6]
    Wait Until Element Is Visible    class=backup-navigation    timeout=30s
    Wait Until Element Is Visible    class=v-data-table-header    timeout=30s
    # Need to verify the body of the table is visible as well
    Click Link    Schedules
    Click Link    Restores




