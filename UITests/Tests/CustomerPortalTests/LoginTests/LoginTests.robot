*** Settings ***

Documentation    Successful Login test
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot


Test Setup       Begin Test
Test Teardown    Closing browser

*** Test Cases ***

LoginTests
    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}


