*** Settings ***

Documentation    Services with MaxScale Workspace > Query Editor test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/Utils/ConnectToDatabase.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServiceQueryEditorKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/LeaveQueryEditor.robot

Test Setup       Begin Test
Test Teardown    End Test

*** Test Cases ***

WorkspaceQueryEditor
    [Tags]    CRUD

    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider'    ${PROVIDER}
    LaunchServiceDetailsKeywords.Select region    ${REGION}
    LaunchServiceDetailsKeywords.Select 'instance size'    ${SIZE}
    LaunchServiceDetailsKeywords.Select 'transactional storage size'    ${STORAGE}
    LaunchServiceDetailsKeywords.Select 'replicas/nodes'
    LaunchServiceDetailsKeywords.Select 'Server' version    ${SERVER}
    LaunchServiceDetailsKeywords.Input 'service name'
    LaunchServiceDetailsKeywords.Click on 'Launch Service' button
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Wait for status 'Healthy'
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Set up/Manage allowlist' label
    SecureAccessKeywords.Verify page title is 'IP allowlist for service access'
    SecureAccessKeywords.Whitelist an IP address    ${IP_ADDRESS}
    LeftHandNavigationKeywords.Click on 'Workspace' link
    ServiceQueryEditorKeywords.Navigate to 'Workspace / Query Editor' page
    ServiceQueryEditorKeywords.Choose value from the 'Query Editor' dropdown    ${TOPOLOGY_NAME_VALUE}
    ServiceQueryEditorKeywords.Verify the service is connected successfully
    LeftHandNavigationKeywords.Click on 'Dashboard' link
    LeaveQueryEditor.Verify modal title is 'Are you sure you want to leave?'
    LeaveQueryEditor.Disconnect all services
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServicesDashboardKeywords.Click on 'Connect' button
    ConnectToServiceKeywords.Verify page title is 'Connect to service'
    ConnectToServiceKeywords.Get FQDN text value
    ConnectToServiceKeywords.Get port text value
    ConnectToServiceKeywords.Get 'Username' text value
    ConnectToServiceKeywords.Get 'Default password' text value
    ConnectToServiceKeywords.Get 'default character set' value    ${TOPOLOGY}
    ConnectToServiceKeywords.Click on 'Close' button
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}
