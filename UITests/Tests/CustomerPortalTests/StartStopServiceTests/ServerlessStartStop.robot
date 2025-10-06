*** Settings ***

Documentation    Serverless + StartStop CRUD test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SkyBookKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/StopServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/StartServiceKeywords.robot

Test Setup       Begin Test
Test Teardown    End Serverless Test

*** Test Cases ***

ServerlessCRUDStartStop
    [Tags]    CRUD    Feature Flag

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    FeatureFlags.Set current feature flags
    FeatureFlags.Feature flag 'Serverless' condition
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Input 'service name' for Serverless
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
    ConnectToServiceKeywords.Click on the 'skybook' link
    SkyBookKeywords.Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed
    ConnectToServiceKeywords.Click the 'Cancel' button

    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Stop service' label
    StopServiceKeywords.Verify page title is 'Stop service'
    StopServiceKeywords.Click "Stop this Service" Button
    ServicesDashboardKeywords.Wait for status 'Stopped'
    ServicesDashboardKeywords.Validate 'Connect' button is disabled
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Start service' label
    StartServiceKeywords.Verify page title is 'Start service'
    StartServiceKeywords.Click "Start this Service" Button
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Click on the 'skybook' link
    SkyBookKeywords.Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed
