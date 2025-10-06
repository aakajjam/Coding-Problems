*** Settings ***

Documentation    Compare Default Config Variables with the Predefined
Library          SeleniumLibrary
Library          ExcelLibrary
Resource         ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/LeftHandNavigationKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/ConfigurationManagerKeywords.robot
Resource         ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SettingsKeywords.robot

Test Setup       Begin Test
Test Teardown    Closing browser

*** Test Cases ***

CompareDefaultConfigVariablesWithThePredefined
    [Tags]    Config Manager

    CommonKeywords.User Sign In    ${ENV}    ${USERNAME}    ${PASSWORD}
    LeftHandNavigationKeywords.Click on 'Settings' link
    SettingsKeywords.Verify 'Settings' page is displayed
    SettingsKeywords.Click on 'Configuration Manager' link
    ConfigurationManagerKeywords.Verify the page is 'Configuration Manager'
    ConfigurationManagerKeywords.Select from 'Saved Configurations' - SkySQL Default    ${CONFIG_TOPOLOGY_TYPE}
    ConfigurationManagerKeywords.Read and list all the config variables and their default values from the csv file     ${CONFIG_TOPOLOGY_TYPE}
    ConfigurationManagerKeywords.Compare the variables from the sheet and from the UI are the same    ${CONFIG_TOPOLOGY_TYPE}
