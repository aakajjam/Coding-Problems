*** Settings ***

Documentation   Sanity Standalone AWS UI Test
Resource        ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource        ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceKeywords.robot
Resource        ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot

Test Setup      Begin Test
Test Teardown   Custom Teardown

*** Test Cases ***

TransactionsStandaloneSanityTest
    [Tags]    SanityTest_AWS_Standalone

    CommonKeywords.User sign in  ${ENV}  ${USERNAME}  ${PASSWORD}
    LaunchServiceKeywords.Click on 'Launch new service' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a MariaDB SkySQL service'
    LaunchServiceDetailsKeywords.Click on 'Enterprise Server Single node' radio button
    LaunchServiceDetailsKeywords.Input Service Details for Sanity Standalone
