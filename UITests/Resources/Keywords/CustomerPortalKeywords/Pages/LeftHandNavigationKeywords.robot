*** Settings ***

Documentation    Left Hand Navigation Menu Keywords
Library          SeleniumLibrary

*** Variables ***

${DASHBOARD_LINK}                     xpath = //*[contains(text(), 'Dashboard')]
${WORKSPACE_LINK}                     xpath = //*[contains(text(), 'Workspace')]
${SETTINGS_LINK}                      xpath = //*[contains(text(), 'Settings')]

*** Keywords ***

Click on 'Dashboard' link
    [Documentation]    Click on 'Dashboard' link on the left hand navi bar

    wait until element is visible    ${DASHBOARD_LINK}    15 sec    error = 'Dashboard' link is not displayed on the 'Left Hand Navigation Menu'!
    click element    ${DASHBOARD_LINK}

    log to console     Click on 'Dashboard' link

Click on 'Workspace' link
    [Documentation]    Click on 'Workspace' link on the left hand navi bar

    wait until element is visible    ${WORKSPACE_LINK}    15 sec    error = 'Workspace' link is not displayed on the 'Left Hand Navigation Menu'!
    click element    ${WORKSPACE_LINK}

    log to console     Click on 'Workspace' link

Click on 'Settings' link
    [Documentation]    Expand the left hand navi bar and click on 'Settings'

    wait until element is visible    ${SETTINGS_LINK}    15 sec    error = 'Settings' link is not displayed!
    click element    ${SETTINGS_LINK}

    log to console     Click on 'Settings' link
