*** Settings ***

Documentation    Common keywords for open and close browser
Library          SeleniumLibrary
Library          OperatingSystem
Library          String
Library          ../../CustomLibraries/Utils.py
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/DeleteServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SignUpOrSignInKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SignInKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/DeleteThisConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot

*** Variables ***

&{browser_logging_capability}    performance=ALL
&{capabilities}    browserName=${BROWSER}    version=${EMPTY}    platform=ANY    goog:loggingPrefs=${browser_logging_capability}

*** Keywords ***

Begin Test
    [Documentation]  Open the browser and maximize it

    ${BROWSER_LOWER} =	convert to lower case    ${BROWSER}
    ${HTTPS_PROXY_SET} =    Get Environment Variable    HTTPS_PROXY    NONE

    Log To Console    Opening browser ${BROWSER}
    IF    "${HTTPS_PROXY_SET}" != "NONE" and "${BROWSER_LOWER}" == "firefox"
        Log To Console    Setting Firefox proxy
        ${profile} =    set firefox proxy    %{HTTPS_PROXY}
        Create webdriver    Firefox    firefox_profile=${profile}
    ELSE
        IF    "${HTTPS_PROXY_SET}" != "NONE"
            Log To Console    Running browser ${BROWSER} with proxy
        ELSE
            Log To Console    Running browser ${BROWSER} without proxy
        END
        Open browser    about:blank    ${BROWSER}    desired_capabilities=${capabilities}
    END

    Set Window Size    ${SCREEN_WIDTH}    ${SCREEN_HEIGHT}

End Test
    [Documentation]  Delete the topology and close the browser

    Delete topology activities
    Close browser

End Configuration Test
    [Documentation]  Delete topology, newly created configuration and close the browser

    Run Keyword And Ignore Error    LeftHandNavigationKeywords.Click on 'Dashboard' link
    Delete topology activities

    Run Keyword And Ignore Error    LeftHandNavigationKeywords.Click on 'Settings' link
    Run Keyword And Ignore Error    SettingsKeywords.Verify 'Settings' page is displayed
    Run Keyword And Ignore Error    SettingsKeywords.Click on 'Configuration Manager' link
    Run Keyword And Ignore Error    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    Delete configuration activities

    Close browser

End Serverless Test
    [Documentation]  Delete the 'Serverless' topology and close the browser

    Run Keyword And Ignore Error    SignUpOrSignInKeywords.Navigate to Customer Portal    ${ENV}
    Delete topology activities
    Close browser

End Test Xpand Replication
    [Documentation]  Delete both Xpand services and close the browser

    Run Keyword And Ignore Error    SignUpOrSignInKeywords.Navigate to Customer Portal    ${ENV}
    Delete topology activities
    Delete topology activities, service 2
    Close browser

Delete topology activities
    [Documentation]  High level keyword combining low level keywords for delete a topology

    Run Keyword And Ignore Error    ServicesDashboardKeywords.Click on 'Manage' button
    Run Keyword And Ignore Error    ServicesDashboardKeywords.Click on 'Delete Service' label
    Run Keyword And Ignore Error    DeleteServiceKeywords.Verify page title is 'Delete'
    Run Keyword And Ignore Error    DeleteServiceKeywords.Input 'delete' text and click 'Yes, delete'
    Run Keyword And Ignore Error    ServicesDashboardKeywords.Verify topology is not present anymore

Delete topology activities, service 2
    [Documentation]  High level keyword combining low level keywords for delete a topology

    Run Keyword And Ignore Error    ServicesDashboardKeywords.Click on 'Manage' button, service 2
    Run Keyword And Ignore Error    ServicesDashboardKeywords.Click on 'Delete Service' label, service 2
    Run Keyword And Ignore Error    DeleteServiceKeywords.Verify page title is 'Delete', service 2
    Run Keyword And Ignore Error    DeleteServiceKeywords.Input 'delete' text and click 'Yes, delete'
    Run Keyword And Ignore Error    ServicesDashboardKeywords.Verify topology is not present anymore, service 2

User sign in
    [Documentation]  High level keyword combining low level keywords for successful sign in
    [Arguments]    ${ENV}    ${USERNAME}    ${PASSWORD}

    SignUpOrSignInKeywords.Navigate to Customer Portal    ${ENV}
    SignUpOrSignInKeywords.Verify page title is 'Login - SkySQL'
    SignUpOrSignInKeywords.Populate 'Email'    ${USERNAME}
    SignUpOrSignInKeywords.Populate 'Password'    ${PASSWORD}
    SignUpOrSignInKeywords.Click on 'Continue' button

Delete configuration activities
    [Documentation]  High level keyword combining low level keywords for delete configuration

    Run Keyword And Ignore Error    ConfigurationManagerKeywords.Click on the 'Delete config' option for the newly created config
    Run Keyword And Ignore Error    DeleteThisConfigurationKeywords.Verify page title is 'Delete this configuration'
    Run Keyword And Ignore Error    DeleteThisConfigurationKeywords.Click on 'Yes, delete this configuration' button
    Run Keyword And Ignore Error    ConfigurationManagerKeywords.Verify configuration is not present anymore

Closing browser
    [Documentation]  Only close the browser

    Close browser

Custom Teardown
    [Documentation]  Custom teardown used for Sanity Tests

    Run Keyword If Test Failed   Log   Test failed
    Run Keyword If Test Failed   Capture Page Screenshot
    Run Keyword If Test Passed   Log   Test passed
    close browser
