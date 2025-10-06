*** Settings ***
Documentation    Configuration Manager Modal Window Keywords
Library          SeleniumLibrary
Library          String
Library          Collections
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${YES_DELETE_CONFIG_BUTTON}                     xpath = //button//*[contains(text(),'Yes, delete this configuration')]

*** Keywords ***

Verify page title is 'Delete this configuration'
    [Documentation]    Check the page title is 'Delete this configuration'

    # ${DELETE_THIS_CONFIGURATION_PAGE_TITLE} & ${NEW_CONFIGURATION_NAME_VALUE} are taken from 'TestData/VerificationStrings.robot'
    wait until page contains    ${DELETE_THIS_CONFIGURATION_PAGE_TITLE}    15 sec    error = 'Delete this configuration' page title is not displayed!

    log to console    Verify page title is 'Delete this configuration'

Click on 'Yes, delete this configuration' button
    [Documentation]    Click on 'Yes, delete this configuration' button

    wait until element is visible    ${YES_DELETE_CONFIG_BUTTON}    5 sec    error = 'Yes, delete this configuration' button is not displayed!
    mouse over    ${YES_DELETE_CONFIG_BUTTON}
    click element    ${YES_DELETE_CONFIG_BUTTON}

    log to console    Click on 'Yes, delete this configuration' button
