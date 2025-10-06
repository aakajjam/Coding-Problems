*** Settings ***

Documentation    'Set up your Private Link' or 'Set up your Private Service Connect' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../Pages/ServicesDashboardKeywords.robot

*** Variables ***

# PSC abbreviation for PRIVATE_SERVICE_CONNECT and PL - for PRIVATE_LINK
${SET_UP_MANAGE_PSC_PL_MODAL_TITLE} =        xpath = (//*[contains(@class, 'v-dialog--active')]//p)[1]
${ENTER_NEW_PROJECT_OR_ACCOUNT_ID_INPUT} =   xpath = //*[@placeholder='Add account ID' or @placeholder='Add project ID']
${PL_PSC_OK_BUTTON} =                        xpath = //*[contains(@class, 'v-dialog base-dialog v-dialog--active')]//*[contains(text(),'Ok') and not(@disabled)]

*** Keywords ***

Verify modal title is 'Set up/Manage your Private Service Connect/Private Link'
    [Documentation]    Check the modal title is 'Set up/Manage your Private Service Connect' or 'Set up/Manage your Private Link'

    wait until element is visible    ${SET_UP_MANAGE_PSC_PL_MODAL_TITLE}    30s    error = 'Set up/Manage your Private Service Connect' or 'Set up/Manage your Private Link' modal is not visible!

    # ${SET_UP_MANAGE_PSC_PL_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    ${set_up_manage_psc_pl_modal_title} =    get text    ${SET_UP_MANAGE_PSC_PL_MODAL_TITLE}

    should contain any    ${SET_UP_MANAGE_PSC_PL_EXPECTED_TITLE}    ${set_up_manage_psc_pl_modal_title}

    log to console    Verify modal title is 'Set up/Manage your Private Service Connect/Private Link'

Set up PSC or PL
    [Documentation]    Set up Private Service Connect or Private Link connection
    [Arguments]    ${PROJECT_OR_ACCOUNT_ID}

    wait until page contains element    ${ENTER_NEW_PROJECT_OR_ACCOUNT_ID_INPUT}  15s    error = "Add project/account ID" is not displayed on the Set up/Manage PSC/PL modal !
    click element    ${ENTER_NEW_PROJECT_OR_ACCOUNT_ID_INPUT}
    input text    ${ENTER_NEW_PROJECT_OR_ACCOUNT_ID_INPUT}    ${PROJECT_OR_ACCOUNT_ID}
    click element    ${PL_PSC_OK_BUTTON}

    log to console    Set up Private Service Connect or Private Link connection
