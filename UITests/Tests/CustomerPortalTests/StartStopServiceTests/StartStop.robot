*** Settings ***

Documentation    ${TOPOLOGY_SHORT_NAME_DICT}[${TOPOLOGY}] CRUD + StartStop test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/Utils/ConnectToDatabase.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/StopServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/StartServiceKeywords.robot

Test Setup       Begin Test
Test Teardown    End Test

*** Test Cases ***

StartStop_CRUD
    [Tags]    CRUD

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
    LaunchServiceDetailsKeywords.Input 'service name'    ${USE_DEFAULT_NAME}
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
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}

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
    ConnectToDatabase.Connect to the current database    ${TOPOLOGY}
