*** Settings ***

Documentation   Sanity Xpand GCP UI Test
Resource        ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource        ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceKeywords.robot
Resource        ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot


Test Setup      Begin Test
Test Teardown   Custom Teardown

*** Test Cases ***

DistributedSQLSanityTest
    [Tags]    SanityTest_GCP_DistributedSQL

    CommonKeywords.User sign in  ${ENV}  ${USERNAME}  ${PASSWORD}
    LaunchServiceKeywords.Click on 'Launch new service' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a MariaDB SkySQL service'
    LaunchServiceDetailsKeywords.Click on 'Transactions' radio button
    LaunchServiceDetailsKeywords.Click on 'Xpand Distributed SQL' radio button
    LaunchServiceDetailsKeywords.Input Service Details for Sanity Distributed SQL