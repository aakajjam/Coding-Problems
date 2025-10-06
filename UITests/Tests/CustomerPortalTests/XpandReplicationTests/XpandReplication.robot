*** Settings ***

Documentation    Xpand Replication "To/From/Both ways" + CRUD for both Xpands
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/Utils/ConnectToDatabase.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/ConnectToServiceKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/SecureAccessKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Modals/XpandGlobalReplicationKeywords.robot

Test Setup       Begin Test
Test Teardown    End Test Xpand Replication

*** Test Cases ***

XpandReplication
    [Tags]    CRUD

#Launch Xpand 2
    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Click on 'Launch a cloud database' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a Cloud Database'
    LaunchServiceDetailsKeywords.Select 'Type' and 'Topology'    ${TYPE}    ${TOPOLOGY}
    LaunchServiceDetailsKeywords.Select 'Cloud provider' 2    ${PROVIDER_2}
    LaunchServiceDetailsKeywords.Select region 2   ${REGION_2}
    LaunchServiceDetailsKeywords.Select 'instance size'    ${SIZE}
    LaunchServiceDetailsKeywords.Select 'transactional storage size'    ${STORAGE}
    LaunchServiceDetailsKeywords.Select 'replicas/nodes'
    LaunchServiceDetailsKeywords.Select 'Server' version    ${SERVER}
    LaunchServiceDetailsKeywords.Input second 'service name'
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
    ConnectToDatabase.Connect to Xpand database 2
#Launch Xpand 1
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
    ConnectToDatabase.Connect to Xpand database
#Activate Replication and test it for both Xpands
    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Xpand Global Replication' label
    XpandGlobalReplicationKeywords.Verify page title is 'Set up Xpand Global Replication'
    XpandGlobalReplicationKeywords.Select Direction for Xpand Replication    ${REPLICATION_DIRECTION}
    XpandGlobalReplicationKeywords.Select Service for Xpand Replication
    XpandGlobalReplicationKeywords.Click Save Button for Xpand Replication
    ServicesDashboardKeywords.Wait for Xpand global replication status 'Active'

    ServicesDashboardKeywords.Click on 'Manage' button
    ServicesDashboardKeywords.Click on 'Xpand Global Replication' label
    XpandGlobalReplicationKeywords.Verify page title is 'Edit Xpand Global Replication'
    XpandGlobalReplicationKeywords.Verify replication is correctly displayed for the 1st service
    XpandGlobalReplicationKeywords.Verify Save Button is disabled for Xpand Replication
    XpandGlobalReplicationKeywords.Click Cancel Button for Xpand Replication
    ServicesDashboardKeywords.Click on 'Manage' button, service 2
    ServicesDashboardKeywords.Click on 'Xpand Global Replication' label 2
    XpandGlobalReplicationKeywords.Verify page title is 'Edit Xpand Global Replication'
    XpandGlobalReplicationKeywords.Verify replication is correctly displayed for the 2nd service
    XpandGlobalReplicationKeywords.Verify Save Button is disabled for Xpand Replication
    XpandGlobalReplicationKeywords.Click Cancel Button for Xpand Replication

    ConnectToDatabase.Perform operations in Xpand 1
    ConnectToDatabase.Perform operations in Xpand 2
    ConnectToDatabase.Validate data in Xpand 1    ${REPLICATION_DIRECTION}
    ConnectToDatabase.Validate data in Xpand 2    ${REPLICATION_DIRECTION}
