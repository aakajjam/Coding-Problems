*** Settings ***

Documentation    Apply custom config to service and verify the operation was successful from the UI
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/Utils/ConnectToDatabase.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ApplyDatabaseConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerDetailKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/NewDatabaseConfigurationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot

Test Setup       Begin Test
Test Teardown    End Configuration Test

*** Test Cases ***

ApplyPreviouslyCreatedCustomConfigToService
    [Tags]    Config Manager    CRUD

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    LeftHandNavigationKeywords.Click on 'Settings' link
    SettingsKeywords.Verify 'Settings' page is displayed
    SettingsKeywords.Click on 'Configuration Manager' link
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Click on 'Create New' button
    NewDatabaseConfigurationKeywords.Verify the page title is 'New Database Configuration'
    NewDatabaseConfigurationKeywords.Input configuration name
    NewDatabaseConfigurationKeywords.Select a 'topology'    ${CONFIG_TOPOLOGY_TYPE}
    NewDatabaseConfigurationKeywords.Select 'server version'    ${CONFIG_SERVER_VERSION}
    NewDatabaseConfigurationKeywords.Set new variable values    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}    ${CONFIG_VARIABLE_1_VALUE}    ${CONFIG_VARIABLE_2_VALUE}
    NewDatabaseConfigurationKeywords.Click on the 'Save' button to create new configuration
    ConfigurationManagerDetailKeywords.Compare newly entered config name with the saved one are the same
    NewDatabaseConfigurationKeywords.Click on the back arrow button
    ConfigurationManagerDetailKeywords.Click on the back arrow button
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Verify the newly created config is part of 'Saved configurations' list
    LeftHandNavigationKeywords.Click on 'Dashboard' link
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Select 'instance size'    ${SIZE}
    LaunchServiceDetailsKeywords.Select 'Transactional storage size'    ${STORAGE}
    LaunchServiceDetailsKeywords.Select 'Server' version    ${SERVER}
    LaunchServiceDetailsKeywords.Input 'service name'
    LaunchServiceDetailsKeywords.Click on 'Launch Service' button
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardkeywords.Validate service's topology type is correctly displayed on 'Services' page
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Set up/Manage allowlist' label
    SecureAccessKeywords.Verify page title is 'IP allowlist for service access'
    SecureAccessKeywords.Whitelist an IP address    ${IP_ADDRESS}
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Get FQDN text value
    ConnectToServiceKeywords.Get port text value
    ConnectToServiceKeywords.Get 'Username' text value
    ConnectToServiceKeywords.Get 'Default password' text value
    ConnectToServiceKeywords.Get 'default character set' value    ${TOPOLOGY}
    ConnectToServiceKeywords.Click on 'Close' button
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Apply database configuration' label
    ApplyDatabaseConfigurationKeywords.Select the newly created configuration
    ApplyDatabaseConfigurationKeywords.Click on 'Apply database configuration' button
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}
    ConnectToDatabase.Display the initial database config variable values    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Apply database configuration' label
    ApplyDatabaseConfigurationKeywords.Select the desired configuration    ${CONFIG_NAME}
    ApplyDatabaseConfigurationKeywords.Click on 'Apply database configuration' button
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}
    ConnectToDatabase.Display the altered database config variable values    ${CONFIG_VARIABLE_1}    ${CONFIG_VARIABLE_2}
    ConnectToDatabase.Verify custom config variables are applied to the service
    ServicesDashboardKeywords.Click on service card title
    ServiceDetailsKeywords.Click on the 'Details' tab
    ServiceDetailsKeywords.Compare 'Database configuration' field value with the applied config name    ${CONFIG_NAME}
    ServiceDetailsKeywords.Click on the name of the applied custom config
    ConfigurationManagerDetailKeywords.Verify the 'services with this configuration' section contains the topology name
