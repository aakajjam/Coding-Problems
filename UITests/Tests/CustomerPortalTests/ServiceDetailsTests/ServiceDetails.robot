*** Settings ***
Library           SeleniumLibrary
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServiceDetailsKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ServicesDashboardKeywords.robot


Test Setup       Begin Test
Test Teardown    Closing browser


*** Variables ***


*** Test Cases ***
ServiceDetailsTests
    [Documentation]    Test to check the service details page
    [Tags]    ServiceDetails
    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    ServicesDashboardKeywords.Verify page title is 'Services'
    ServiceDetailsKeywords.Verify an underlined service name and click
    ServiceDetailsKeywords.Verify user is on service details page
    ServiceDetailsKeywords.Verify service name title
    ServiceDetailsKeywords.Verify service status strip is displayed
    ServiceDetailsKeywords.Verify 'Connect' and 'Manage' tabs are displayed
    ServiceDetailsKeywords.Verify 'Monitoring', Alerts', 'Details' tabs are displayed
    ServiceDetailsKeywords.Verify 'status', 'database', 'alerts', 'queries', 'system' tabs are displayed
    ServiceDetailsKeywords.Verify widgets in 'Details' tab