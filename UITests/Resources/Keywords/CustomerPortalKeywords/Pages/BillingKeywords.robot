*** Settings ***
Resource         ../../../../Resources/Keywords/Utils/CommonKeywords.robot

*** Variables ***
${USER_MENU}                 css=[data-test-id="btn-user-menu-action"]
${BILLING_DROPDOWN}          css=[data-test-id="user-menu-item-billing"]
${BILLING_TITLE}             class=view-headline
${MONTH_TO_MONTH_CHARGES}    css=[data-test-id="section-current-charges"]
${SKYAI_TOKENS}              css=[data-test-id="section-copilot-tokens"]
${BILLING_TOTAL}             css=[data-test-id="row-billing-total"]
${TIME_RANGE}                css=.time-range-input
${CONTACTS_PANEL}            css=[data-test-id="section-contacts"]
${TAX_INFO_PANEL}            css=[data-test-id="section-tax-info"]
${PAYMENT_METHODS_PANEL}     css=[data-test-id="section-payment-methods"]
${PRIMARY_CONTACT_CARD}      css=[data-test-id="card-primary-contact"]
${BILLING_CONTACT_CARD}      css=[data-test-id="card-billing-contact"]
${SAVED_TAX_INFO_CARD}       css=[data-test-id="card-saved-tax-info"]
${ADD_BUTTON}                css=.add-btn
${DATA_TABLE}                css=.data-table-full



*** Keywords ***
Validate 'Billing' dropdown option and click
    [Documentation]   Navigate to the 'Billing' page from the user menu

    # The variable ${USER_MENU} will be used in other test case to click on the user menu
    wait until element is visible    ${USER_MENU}    timeout=10s
    click element    ${USER_MENU}

    # Click on 'Billing' option in the dropdown
    wait until element is visible    ${BILLING_DROPDOWN}
    click element    ${BILLING_DROPDOWN}

    # Verify the title is 'Billing'
    wait until element is visible   ${BILLING_TITLE}
    ${page_title}=    Get Text    ${BILLING_TITLE}
    ${page_title}=    Strip String    ${page_title}
    Should Be Equal    ${page_title}    Billing

Validate 'Current Usage' page
    [Documentation]    Validate 'Current Usage' page elements
    wait until location contains    billing/usage
    wait until element is visible   ${MONTH_TO_MONTH_CHARGES}
    Wait Until Element Is Visible   ${SKYAI_TOKENS}
    
    
Validate 'Billing History' page
    [Documentation]    Validate the elements on the 'Billing History' page
    Click Link    Billing History
    wait until location contains    billing/history

    # Verify and click on the 'Time Range'
    Wait Until Element Is Visible    ${TIME_RANGE}
    Click Element    ${TIME_RANGE}

Validate 'Billing Profile' page    
    [Documentation]    Validate the elements on the 'Billing Profile' page
    Click Link    Billing Profile
    Wait Until Location Contains    billing/profile
    wait until element is visible    ${CONTACTS_PANEL}    10s
    Wait Until Element Is Visible    ${TAX_INFO_PANEL}    10s
    wait until element is visible    ${PAYMENT_METHODS_PANEL}    10s

    # Verify the 'Payment Methods' panel is expanded
    ${payment_methods_expanded}=    Get Element Attribute    ${PAYMENT_METHODS_PANEL}    aria-expanded
    Should Be Equal    ${payment_methods_expanded}    true
    Wait Until Element Is Visible    ${ADD_BUTTON}
    wait until element is visible    ${DATA_TABLE}

    # Expand the 'Contacts' section and verify the elements are present
    #Wait Until Element Is Not Visible    xpath=//pre     timeout=30s - DO NOT REMOVE
    click element    ${CONTACTS_PANEL}
    ${section_contacts_expanded}=    Get Element Attribute    ${CONTACTS_PANEL}    aria-expanded
    Should Be Equal    ${section_contacts_expanded}    true
    wait until element is visible    ${PRIMARY_CONTACT_CARD}
    Wait Until Element Is Visible    ${BILLING_CONTACT_CARD}

    # Expand the 'Tax Information' section and verify the elements are present
    #Wait Until Element Is Not Visible    xpath=//pre     timeout=10s - DO NOT REMOVE
    Click Element    ${TAX_INFO_PANEL}
    ${section_tax_info_expanded}=    Get Element Attribute    ${TAX_INFO_PANEL}    aria-expanded
    Should Be Equal    ${section_tax_info_expanded}    true
    wait until element is visible    ${SAVED_TAX_INFO_CARD}

    # Ensure the xpath //pre is not visible before clicking otherwise the click may get intercepted by the <pre> element since this site on top of our elements
    # The xpath //pre contains the 404 error message in the UI