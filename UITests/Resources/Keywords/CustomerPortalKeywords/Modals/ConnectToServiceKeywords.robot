*** Settings ***

Documentation    Connect to service modal window Keywords
Library          SeleniumLibrary
Library          String
Library          Collections
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${CONNECT_TO_SERVICE_PAGE_TITLE} =  xpath = //*[contains(text(),'Connect to service: {}')]
${SECONDARY_ENDPOINT_TAB} =         xpath = //*[contains(text(), 'Secondary endpoint')]
${FULLY_QUALIFIED_DOMAIN_NAME} =    xpath = //*[contains(text(), 'Fully qualified domain name')]//..//..//*[contains(text(),'skysql.mariadb.')]
${PORT_TEXT} =                      xpath = //*[contains(text(), 'Read-write port')]//..//div[2]
${USERNAME_TEXT} =                  xpath = //*[contains(text(), 'Username')]//..//div[2]
${DEFAULT_PASSWORD_TEXT} =          xpath = //*[contains(text(), 'Default password')]//..//div[2]
${DEFAULT_PASSWORD_EYE_BUTTON} =    xpath = //*[contains(text(),'Default password')]//..//..//*[contains(@class, 'mdi-eye')]
#${CONNECT_CLOSE_BUTTON} =           xpath = //*[@novalidate='novalidate']//*[contains(text(),'Close')]
${CONNECT_CLOSE_BUTTON}             css=button.cancel
${CLI_TEXT} =                       xpath = //*[contains(text(),'mariadb --host')]
${SKYBOOK_LINK}                     xpath = //*[contains(text(),'skybook')]
${CANCEL_BUTTON}                    xpath = //button[contains(@class,'cancel')]

*** Keywords ***

Verify page title is 'Connect to service'
    [Documentation]    Check the page title is 'Connect to service': '${TOPOLOGY_NAME_VALUE}

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${formatted_locator_connect_to_service} =  Format String  ${CONNECT_TO_SERVICE_PAGE_TITLE}  ${TOPOLOGY_NAME_VALUE}
    wait until element is visible    ${formatted_locator_connect_to_service}  15s  error = 'Connect to service': ${TOPOLOGY_NAME_VALUE} page is not displayed!
    ${connect_to_service_title_actual_title} =  get text    ${formatted_locator_connect_to_service}

    # ${CONNECT_TO_SERVICE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    should contain any     ${connect_to_service_title_actual_title}  ${CONNECT_TO_SERVICE_EXPECTED_TITLE}

    log to console  Verify page title is 'Connect to service: ${TOPOLOGY_NAME_VALUE}'

Click on 'Secondary Endpoint'
    [Documentation]    Click on the 'Secondary Endpoint' tab

    wait until element is visible    ${SECONDARY_ENDPOINT_TAB}    15s  error = 'Secondary Endpoint' is not displayed on the 'Connect' page!
    click element    ${SECONDARY_ENDPOINT_TAB}
    sleep    6
    log to console    Click on 'Secondary Endpoint'

Get FQDN text value
    [Documentation]    Get the FQDN value from the MariaDB CLI string

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${is_second_service_check} =    Evaluate   'second' in '${TOPOLOGY_NAME_VALUE}'

    IF    '${is_second_service_check}' == 'True'
        ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2} =   get text  ${FULLY_QUALIFIED_DOMAIN_NAME}
        set test variable    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}
        log to console    Get FQDN text value: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE_2}
    ELSE
        ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} =  get text  ${FULLY_QUALIFIED_DOMAIN_NAME}
        set test variable    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}
        log to console    Get FQDN text value: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}
    END

Get port text value
    [Documentation]    Get the value of the port

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${is_second_service_check} =    Evaluate   'second' in '${TOPOLOGY_NAME_VALUE}'
    wait until element is visible    ${PORT_TEXT}  15s  error = Port is not displayed on the 'Connect' page!

    IF    '${is_second_service_check}' == 'True'
        ${PORT_TEXT_VALUE_2} =   get text  ${PORT_TEXT}
        set test variable    ${PORT_TEXT_VALUE_2}
        log to console    Get port text value: ${PORT_TEXT_VALUE_2}
    ELSE
        ${PORT_TEXT_VALUE} =  get text  ${PORT_TEXT}
        set test variable    ${PORT_TEXT_VALUE}
        log to console    Get port text value: ${PORT_TEXT_VALUE}
    END

Get 'Username' text value
    [Documentation]    Get the value of the username field

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${is_second_service_check} =    Evaluate   'second' in '${TOPOLOGY_NAME_VALUE}'
    wait until element is visible    ${USERNAME_TEXT}  15s  error = Username is not displayed on the 'Connect' page!

    IF    '${is_second_service_check}' == 'True'
        ${USERNAME_TEXT_VALUE_2} =   get text  ${USERNAME_TEXT}
        set test variable    ${USERNAME_TEXT_VALUE_2}
        log to console    Get 'Username' text value: ${USERNAME_TEXT_VALUE_2}
    ELSE
        ${USERNAME_TEXT_VALUE} =  get text  ${USERNAME_TEXT}
        set test variable    ${USERNAME_TEXT_VALUE}
        log to console    Get 'Username' text value: ${USERNAME_TEXT_VALUE}
    END

Get 'Default password' text value
    [Documentation]    Get the value of the password field

    # ${TOPOLOGY_NAME_VALUE} variable is passed from 'LaunchServiceDetailsKeyword.robot' file -> 'Input service name' keyword
    ${is_second_service_check} =    Evaluate   'second' in '${TOPOLOGY_NAME_VALUE}'

    wait until element is visible    ${DEFAULT_PASSWORD_EYE_BUTTON}    15 sec    error = Reveal password button is not displayed on the 'Connect' page!
    click element    ${DEFAULT_PASSWORD_EYE_BUTTON}    action_chain=True
    wait until element is visible    ${DEFAULT_PASSWORD_TEXT}  15 sec    error = Password is not displayed on the 'Connect' page!

    IF    '${is_second_service_check}' == 'True'
        ${DEFAULT_PASSWORD_TEXT_VALUE_2_text} =   get text  ${DEFAULT_PASSWORD_TEXT}
        ${DEFAULT_PASSWORD_TEXT_VALUE_2} =    set variable   ${DEFAULT_PASSWORD_TEXT_VALUE_2_text.strip()}
        set test variable    ${DEFAULT_PASSWORD_TEXT_VALUE_2}
        log to console    Get 'Default password' text value: ${DEFAULT_PASSWORD_TEXT_VALUE_2}
    ELSE
        ${DEFAULT_PASSWORD_TEXT_VALUE_text} =   get text  ${DEFAULT_PASSWORD_TEXT}
        ${DEFAULT_PASSWORD_TEXT_VALUE} =    set variable   ${DEFAULT_PASSWORD_TEXT_VALUE_text.strip()}
        set test variable    ${DEFAULT_PASSWORD_TEXT_VALUE}
        log to console    Get 'Default password' text value: ${DEFAULT_PASSWORD_TEXT_VALUE}
    END

Get 'default character set' value without SSL
    [Arguments]    ${TOPOLOGY}
    [Documentation]    Get the FQDN value from the MariaDB CLI string when there is no SSL certificate in the connection string

    IF    '${TOPOLOGY}' == 'Distributed'
        ${CLI_TEXT_VALUE} =  get text  ${CLI_TEXT}
        @{split_cli} =  split string  ${CLI_TEXT_VALUE}
        ${DEFAULT_CHARACTER_SET} =  get from list  ${split_cli}  8
        ${split_char_set} =  split string  ${DEFAULT_CHARACTER_SET}  =
        ${DEFAULT_CHARACTER_SET_TEXT_VALUE} =  get from list  ${split_char_set}  1

        log to console    Get default character set value without SSL: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}

        set test variable    ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    END

Get 'default character set' value
    [Arguments]    ${TOPOLOGY}
    [Documentation]    Get the FQDN value from the MariaDB CLI string when there is SSL certificate in the connection string

    IF    '${TOPOLOGY}' == 'Distributed'
        ${CLI_TEXT_VALUE} =  get text  ${CLI_TEXT}
        @{split_cli} =  split string  ${CLI_TEXT_VALUE}
        ${DEFAULT_CHARACTER_SET} =  get from list  ${split_cli}  10
        ${split_char_set} =  split string  ${DEFAULT_CHARACTER_SET}  =
        ${DEFAULT_CHARACTER_SET_TEXT_VALUE} =  get from list  ${split_char_set}  1
        log to console    Get default character set value: ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
        set test variable    ${DEFAULT_CHARACTER_SET_TEXT_VALUE}
    END

Extract FQDN text value from the CLI command
    [Documentation]    Extract FQDN text value from the CLI command
    wait until element is visible    ${CLI_TEXT}    15s    error = The Cli text is not displayed on the 'Connect to service' page!
    ${cli_string_text_value} =  get text  ${CLI_TEXT}
    @{cli_data} =    split string    ${cli_string_text_value}    ${SPACE}
    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE} =    set variable    ${cli_data}[2]
    set test variable    ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}

    log to console    Get FQDN text value: ${FULLY_QUALIFIED_DOMAIN_NAME_TEXT_VALUE}

Click on 'Close' button
    [Documentation]    Close 'Connect to service' modal window

    wait until element is visible  ${CONNECT_CLOSE_BUTTON}  30s  error = The Close button on Connect modal is not displayed!
    wait until element is enabled  ${CONNECT_CLOSE_BUTTON}  30s  error = The Close button on Connect modal is not enabled!
    click element    ${CONNECT_CLOSE_BUTTON}

    log to console    Click on 'Close' button

Click on the 'skybook' link
    [Documentation]    Click on the link that contains 'skybook'

    wait until element is visible  ${SKYBOOK_LINK}  15s  error = The 'skybook' link is not displayed on the 'Connect to service' page!
    click element    ${SKYBOOK_LINK}

    log to console    Click on the 'skybook' link

Click the 'Cancel' button
    [Documentation]    Click the 'Cancel' button on the conncect to service page

    wait until element is visible    ${CANCEL_BUTTON}    15s  error = The 'Cancel' button is not displayed on the 'Connect to service' page!
    click element    ${CANCEL_BUTTON}

    log to console    Click the 'Cancel' button
