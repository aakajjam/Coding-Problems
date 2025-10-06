*** Settings ***

Documentation    Disconnect Private Link or Disconnect Private Service Connect page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../Pages/ServicesDashboardKeywords.robot

*** Variables ***

# PSC abbreviation for PRIVATE_SERVICE_CONNECT and PL - for PRIVATE_LINK
${DISCONNECT_PSC_PL_LINK} =                  xpath = //*[@class='pointer disconnect-private-link']
${DISCONNECT_PSC_PL_BUTTON} =                xpath = //*[@type='button']//*[contains(text(),'Disconnect')]

*** Keywords ***

Disconnect PSC or PL
    [Documentation]    Disconnect Private Service Connect or Private Link

    wait until element is visible    ${DISCONNECT_PSC_PL_LINK}  15s    error = Disconnect Private Service Connect or Private Link is not displayed on the Set up/Manage PSC/PL modal !
    click element    ${DISCONNECT_PSC_PL_LINK}

    wait until element is visible    ${DISCONNECT_PSC_PL_BUTTON}  15s    error = "Disconnect" button is not displayed on the Disconnect Private Service Connect/Private Link modal !
    click element    ${DISCONNECT_PSC_PL_BUTTON}

    log to console    Disconnect Private Service Connect or Private Link
