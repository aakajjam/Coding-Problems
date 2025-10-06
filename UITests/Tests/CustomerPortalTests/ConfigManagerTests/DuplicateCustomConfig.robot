*** Settings ***

Documentation    Duplicate a custom configuration
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/NewDatabaseConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/DuplicateConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerDetailKeywords.robot

Test Setup       Begin Test
Test Teardown    End Configuration Test

*** Test Cases ***

DuplicateCustomConfig
    [Tags]    Config Manager

# Create new config
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
# Duplicate it
    ConfigurationManagerKeywords.Click on the three dots options button for the desired config
    ConfigurationManagerKeywords.Click the "Duplicate" label option
    DuplicateConfigurationKeywords.Verify page title is 'Duplicate {CONFIGURATION_NAME}'
    DuplicateConfigurationKeywords.Input name of the duplicated config
    DuplicateConfigurationKeywords.Click 'Duplicate' button
    ConfigurationManagerDetailKeywords.Verify the duplicated config is correctly displayed
