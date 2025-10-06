*** Settings ***

Documentation    Reset to defaults variable values for a new custom configuration
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/NewDatabaseConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerDetailKeywords.robot

Test Setup       Begin Test
Test Teardown    End Configuration Test

*** Test Cases ***

ResetToDefaultsVariableValuesNewCustomConfig
    [Documentation]    The user is able to reset updated variable values to the default ones via 'Reset to Defaults'
    ...    button for a new custom configuration.
    [Tags]    Config Manager

    CommonKeywords.User Sign In    ${ENV}    ${USERNAME}    ${PASSWORD}
    LeftHandNavigationKeywords.Click on 'Settings' link
    SettingsKeywords.Verify 'Settings' page is displayed
    SettingsKeywords.Click on 'Configuration Manager' link
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Click on 'Create New' button
    NewDatabaseConfigurationKeywords.Verify the page title is 'New Database Configuration'
    NewDatabaseConfigurationKeywords.Select a 'topology'    ${CONFIG_TOPOLOGY_TYPE}
    NewDatabaseConfigurationKeywords.Select 'server version'    ${CONFIG_SERVER_VERSION}
    NewDatabaseConfigurationKeywords.Get the third variable value
    NewDatabaseConfigurationKeywords.Set new value of the third variable
    NewDatabaseConfigurationKeywords.Click on the 'Reset To Defaults' button
    NewDatabaseConfigurationKeywords.Verify third variable value is reset to the initial one
