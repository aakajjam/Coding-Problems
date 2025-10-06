*** Settings ***

Documentation    Settings Page Keywords
Library          SeleniumLibrary
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${CONFIGURATION_MANAGER_LINK}       xpath = //*[contains(text(),'Configuration Manager')]

*** Keywords ***

Verify 'Settings' page is displayed
    [Documentation]    Verify 'Settings' page is displayed

    FOR    ${configuration_manager_link_text}     IN    @{SETTINGS_LINKS_LINK}
        wait until page contains    ${configuration_manager_link_text}
    END

    log to console    Verify 'Settings' page is displayed

Click on 'Configuration Manager' link
    [Documentation]    Click on the 'Configuration Manager' link

    wait until element is visible     ${CONFIGURATION_MANAGER_LINK}    6 sec    error = 'Configuration Manager' link is not displayed!

    click element    ${CONFIGURATION_MANAGER_LINK}

    log to console    Click on 'Configuration Manager' link

