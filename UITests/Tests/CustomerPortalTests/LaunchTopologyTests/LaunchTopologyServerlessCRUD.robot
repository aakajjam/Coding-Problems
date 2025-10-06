*** Settings ***

Documentation    Serverless CRUD test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SkyBookKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot

Test Setup       Begin Test
# Test Teardown    End Serverless Test

*** Test Cases ***

ServerlessCRUD
    [Tags]    CRUD    Feature Flag

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    # FeatureFlags.Set current feature flags
    # FeatureFlags.Feature flag 'Serverless' condition
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Input 'Service Name' for Serverless    ${USE_DEFAULT_NAME}
    LaunchServiceDetailsKeywords.Click on 'Launch Service' button
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Wait for status 'Healthy'
    # ServicesDashboardkeywords.Validate service's topology type is correctly displayed on 'Services' page - We will modify this in the future
    ServicesDashboardKeywords.Click on 'Manage' button
    # ServicesDashboardKeywords.Click on 'Set up/Manage allowlist' label
    # SecureAccessKeywords.Verify page title is 'IP allowlist for service access'
    # SecureAccessKeywords.Click 'Cancel' on IP allowlist pop up
    # SecureAccessKeywords.Whitelist an IP address    ${IP_ADDRESS} - We can get rid of this since IP address is provided by default
    # ServicesDashboardKeywords.Click on 'Connect' button
    # ConnectToServiceKeywords.Verify page title is 'Connect to service'
    # ConnectToServiceKeywords.Click on 'Close' button
    # ServicesDashboardKeywords.Verify 'Get Started' button is displayed
    # ConnectToServiceKeywords.Click on the 'skybook' link
    # SkyBookKeywords.Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed
