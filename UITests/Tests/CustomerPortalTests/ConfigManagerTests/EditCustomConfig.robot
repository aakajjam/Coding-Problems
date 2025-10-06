*** Settings ***

Documentation    Edit a custom configuration
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/NewDatabaseConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerDetailKeywords.robot

Test Setup       Begin Test
Test Teardown    End Configuration Test

*** Test Cases ***

EditCustomConfig
    [Tags]    Config Manager

    CommonKeywords.User Sign In  ${ENV}  ${USERNAME}  ${PASSWORD}
    LeftHandNavigationKeywords.Click on 'Settings' link
    SettingsKeywords.Verify 'Settings' page is displayed
    SettingsKeywords.Click on 'Configuration Manager' link
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Click on 'Create New' button
    NewDatabaseConfigurationKeywords.Verify the page title is 'New Database Configuration'
    NewDatabaseConfigurationKeywords.Input configuration name
    NewDatabaseConfigurationKeywords.Select a 'topology'    ${CONFIG_TOPOLOGY_TYPE}
    NewDatabaseConfigurationKeywords.Select 'server version'    ${CONFIG_SERVER_VERSION}
    NewDatabaseConfigurationKeywords.Click on the 'Save' button to create new configuration
    ConfigurationManagerDetailKeywords.Compare newly entered config name with the saved one are the same
    NewDatabaseConfigurationKeywords.Click on the back arrow button
    ConfigurationManagerDetailKeywords.Click on the back arrow button
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Verify the newly created config is part of 'Saved configurations' list
    ConfigurationManagerKeywords.Select the desired custom config
    ConfigurationManagerDetailKeywords.Click the Actions dropdown
    ConfigurationManagerDetailKeywords.Select Edit label
    NewDatabaseConfigurationKeywords.Input eddited config name
    NewDatabaseConfigurationKeywords.Set new variable values    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}    ${CONFIG_VARIABLE_1_VALUE}    ${CONFIG_VARIABLE_2_VALUE}
    NewDatabaseConfigurationKeywords.Click on the 'Save' button to create new configuration
    ConfigurationManagerDetailKeywords.Verify config Edit changes are successfully saved    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}    ${CONFIG_VARIABLE_1_VALUE}    ${CONFIG_VARIABLE_2_VALUE}
