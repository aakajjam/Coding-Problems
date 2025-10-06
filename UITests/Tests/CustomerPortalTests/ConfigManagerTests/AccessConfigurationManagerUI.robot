*** Settings ***

Documentation    Access Configuration Manager UI test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot

Test Setup       Begin Test
Test Teardown    Closing browser

*** Test Cases ***

AccessConfigurationManagerUI
    [Documentation]    Validate the access to the Configuration Manager from the UI
    [Tags]    Config Manager

    CommonKeywords.User Sign In  ${ENV}  ${USERNAME}  ${PASSWORD}
    LeftHandNavigationKeywords.Click on 'Settings' link
    SettingsKeywords.Verify 'Settings' page is displayed
    SettingsKeywords.Click on 'Configuration Manager' link
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Verify default configurations are present

