*** Settings ***

Documentation    SkyBook Page Keywords
Library          SeleniumLibrary

*** Variables ***

${SKYBOOK_LOGO}               xpath = //*[contains(@class, 'header')]//*[contains(text(),'SkyBook')]

*** Keywords ***

Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed
    [Documentation]    Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed

    switch window    NEW
    wait until element is visible    ${SKYBOOK_LOGO}    90 sec    error = SkyBook logo is not displayed on the 'SkyBook' page!
    page should contain element    ${SKYBOOK_LOGO}    message = SkyBook logo is not contained on the 'SkyBook' page!

    switch window    MAIN

    log to console    Verify 'SkyBook' link is successfully opened in a new browser tab and its logo is displayed

