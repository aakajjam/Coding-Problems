*** Settings ***

Documentation   Sanity Analytics GCP UI Test
Resource        ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource        ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceKeywords.robot
Resource        ../../../../Resources/Keywords/CustomerPortalKeywords/Pages/LaunchServiceDetailsKeywords.robot

Test Setup      Begin Test
Test Teardown   Custom Teardown

*** Test Cases ***

SingleNodeAnalyticsSanityTest
    [Tags]    SanityTest_GCP_Analytics

    CommonKeywords.User sign in  ${ENV}  ${USERNAME}  ${PASSWORD}
    LaunchServiceKeywords.Click on 'Launch new service' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a MariaDB SkySQL service'
    LaunchServiceDetailsKeywords.Click on 'Analytics' type
    LaunchServiceDetailsKeywords.Click on 'ColumnStore Analytics Warehouse'
    LaunchServiceDetailsKeywords.Input Service Details for Sanity Analytics

MultiNodeAnalyticsSanityTest
    [Tags]    SanityTest_GCP_Analytics

    CommonKeywords.User sign in  ${ENV}  ${USERNAME}  ${PASSWORD}
    LaunchServiceKeywords.Click on 'Launch new service' button
    LaunchServiceDetailsKeywords.Verify page title is 'Launch a MariaDB SkySQL service'
    LaunchServiceDetailsKeywords.Click on 'Analytics' type
    LaunchServiceDetailsKeywords.Click on 'ColumnStore Analytics Warehouse'
    LaunchServiceDetailsKeywords.Input Service Details for Sanity Analytics
