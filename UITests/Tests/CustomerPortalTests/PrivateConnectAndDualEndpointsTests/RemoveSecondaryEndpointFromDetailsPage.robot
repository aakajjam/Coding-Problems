*** Settings ***

Documentation    ${TOPOLOGY_SHORT_NAME_DICT}[${TOPOLOGY}] Remove Secondary endpoint from Details page
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/Utils/ConnectToDatabase.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/RemoveSecondaryEndpoint.robot

Test Setup       Begin Test
Test Teardown    End Test

*** Test Cases ***

RemoveSecondaryEndpointFromDetailsPage
    [Tags]    CRUD    Feature Flag

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Select 'instance size'    ${SIZE}
    LaunchServiceDetailsKeywords.Select 'Transactional storage size'    ${STORAGE}
    LaunchServiceDetailsKeywords.Select 'replicas/nodes'
    LaunchServiceDetailsKeywords.Select 'Server' version    ${SERVER}
    LaunchServiceDetailsKeywords.Input 'service name'
    LaunchServiceDetailsKeywords.Select primary endpoint 'AWS PrivateLink' or 'Google Private Service Connect'    ${AWS_GCP_PRIMARY_ENDPOINT}
    LaunchServiceDetailsKeywords.Add Secondary Endpoint to IP AllowList Primary Endpoint
    LaunchServiceDetailsKeywords.Tick 'Add my current IP' checkbox
    LaunchServiceDetailsKeywords.Click on 'Launch Service' button
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardkeywords.Validate service's topology type is correctly displayed on 'Services' page
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Get port text value
    ConnectToServiceKeywords.Get 'Username' text value
    ConnectToServiceKeywords.Get 'Default password' text value
    ConnectToServiceKeywords.Get 'default character set' value    ${TOPOLOGY}
    ConnectToServiceKeywords.Click on 'Secondary Endpoint'
    ConnectToServiceKeywords.Get FQDN text value
    ConnectToServiceKeywords.Click on 'Close' button
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}

    # Remove secondary endpoint and try to connect again - should NOT be successful
    ServicesDashboardKeywords.Click on service card title
    ServiceDetailsKeywords.Click on the 'Details' tab
    ServiceDetailsKeywords.Click on Remove Secondary endpoint label
    RemoveSecondaryEndpoint.Verify page title is 'Remove secondary endpoint'
    RemoveSecondaryEndpoint.Click 'Remove' button
    LeftHandNavigationKeywords.Click on 'Dashboard' link
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Extract FQDN text value from the CLI command
    ConnectToServiceKeywords.Get port text value
    ConnectToServiceKeywords.Get 'Username' text value
    ConnectToServiceKeywords.Get 'Default password' text value
    ConnectToServiceKeywords.Get 'default character set' value    ${TOPOLOGY}
    ConnectToServiceKeywords.Click on 'Close' button
    ConnectToDatabase.Expect unsuccessful connection to the DB
