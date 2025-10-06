*** Settings ***
Library         SeleniumLibrary
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/BillingKeywords.robot

Test Setup       Begin Test
Test Teardown    End Test

*** Test Cases ***
Billing
    CommonKeywords.User sign in     ${ENV}    ${USERNAME}    ${PASSWORD}
    BillingKeywords.Validate 'Billing' dropdown option and click
    BillingKeywords.Validate 'Current Usage' page
    BillingKeywords.Validate 'Billing History' page
    BillingKeywords.Validate 'Billing Profile' page


