*** Settings ***

Documentation    'Set up secure access' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot
Resource         ../Pages/ServicesDashboardKeywords.robot

*** Variables ***

${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_TITLE} =  xpath = //*[contains(@class, 'v-dialog v-dialog--active')]//*[contains(text(),'IP allowlist for service access')]
#${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_TITLE}    css=.v-card__title
${ENTER_A_NEW_IP_ADDRESS_INPUT} =            xpath = //*[@placeholder='Enter a new IP address']
${SECURE_ACCESS_SAVE_BUTTON} =               xpath = //*[contains(@class, 'v-dialog v-dialog--active')]//*[contains(text(),'Save') and not(@disabled)]
${SECURE_ACCESS_CANCEL_BUTTON}               xpath = //*[contains(@class, 'v-dialog--active')]//..//*[text()='Cancel']

*** Keywords ***

Verify page title is 'IP allowlist for service access'
    [Documentation]    Check the page title is 'IP allowlist for service access'

    wait until element is visible  ${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_TITLE}  30s    error = 'IP allowlist for service access' is not visible!

    ${update_ip_addresses_title_text_actual} =  get text  ${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_TITLE}

    # ${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    should be equal as strings  ${update_ip_addresses_title_text_actual}  ${IP_ALLOW_LIST_FOR_SERVICE_ACCESS_EXPECTED_TITLE}

    log to console    Verify page title is 'IP allowlist for service access'

Whitelist an IP address
    [Documentation]    Whitelist an IP address
    [Arguments]    ${IP_ADDRESS}

    wait until page contains element    ${ENTER_A_NEW_IP_ADDRESS_INPUT}  15s    error = The page doesn't contain 'Enter a new IP address' input field element!
    click element    ${ENTER_A_NEW_IP_ADDRESS_INPUT}
    input text    ${ENTER_A_NEW_IP_ADDRESS_INPUT}    ${IP_ADDRESS}
    click element    ${SECURE_ACCESS_SAVE_BUTTON}
    click element    ${SECURE_ACCESS_SAVE_BUTTON}

    # Wait until the service becomes 'Healthy'. It is in state 'Modifying' while the new IP is being listed.
    ${formatted_locator_topology_status_healthy} =  Format String    ${SERVICE_LAUNCH_STATUS_HEALTHY}    ${TOPOLOGY_NAME_VALUE}
    ${formatted_service_status_label} =    format string    ${SERVICE_STATUS_LABEL}    ${TOPOLOGY_NAME_VALUE}
    wait until page contains element    ${formatted_service_status_label}    6 sec    error = ${formatted_service_status_label} is not contained in the page!

    TRY
        wait until element contains    ${formatted_service_status_label}    ${SERVICE_STATE_MODIFYING}    150 sec    error = '${SERVICE_STATE_MODIFYING}' was not displayed!
    EXCEPT
        element should contain    ${formatted_service_status_label}    ${SERVICE_STATE_HEALTHY}
    END

    ${service_status_label_text} =    get text    ${formatted_service_status_label}
    WHILE    '${service_status_label_text}' != '${SERVICE_STATE_HEALTHY}'    limit= 60
        sleep  6 sec
        wait until page contains element    ${formatted_service_status_label}    6 sec
        ${service_status_label_text} =    get text    ${formatted_service_status_label}
    END

    IF    '${service_status_label_text}' == '${SERVICE_STATE_FAILED}'
        fatal error    The topology being launched returns status FAILED!
    END

    log to console    Whitelist an IP address

Click 'Cancel' on IP allowlist pop up
    [Documentation]    Click 'Cancel' on IP allowlist pop up
    
    wait until element is visible    ${SECURE_ACCESS_CANCEL_BUTTON}  15s    error = The page doesn't contain 'Cancel' button
    click element    ${SECURE_ACCESS_CANCEL_BUTTON}
    log to console    message= 'Clicked 'Cancel' on IP allowlist pop up'