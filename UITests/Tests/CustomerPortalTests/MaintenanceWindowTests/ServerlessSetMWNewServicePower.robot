*** Settings ***

Documentation    Serverless Set Maintenance Window New Service Power test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SkyBookKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot

Test Setup       Begin Test
Test Teardown    End Serverless Test

*** Test Cases ***

ServerlessSetMWNewServicePower
    [Tags]    Power Only    Feature Flag    CRUD

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    FeatureFlags.Set current feature flags
    FeatureFlags.Feature flag 'Serverless' condition
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Input 'service name' for Serverless
    LaunchServiceDetailsKeywords.Validate the default value for 'Maintenance window'
    LaunchServiceDetailsKeywords.Choose value from the 'Maintenance window' dropdown    ${MAINTENANCE_WINDOW}
    LaunchServiceDetailsKeywords.Click on 'Launch Service' button
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardKeywords.Click on service card title
    ServiceDetailsKeywords.Click on the 'Details' tab
    ServiceDetailsKeywords.Compare 'Maintenance' field value with the applied maintenance window
    LeftHandNavigationKeywords.Click on 'Dashboard' link
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Set up/Manage allowlist' label
    SecureAccessKeywords.Verify page title is 'IP allowlist for service access'
    SecureAccessKeywords.Whitelist an IP address    ${IP_ADDRESS}
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Click on the 'skybook' link
    SkyBookKeywords.Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed
