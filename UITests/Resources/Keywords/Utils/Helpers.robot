*** Settings ***

Documentation    Helpers Functions Keywords
Library          SeleniumLibrary
Library          DateTime
Library          RequestsLibrary
Library          Collections
Library          ImapLibrary
Library          ../../../Resources/CustomLibraries/ParseCSVandJSON.py
Resource         ../../TestData/VerificationStrings.robot

*** Variables ***

${STANDALONE_ABBR}                                    st
${PRIMARY_REPLICA_ABBR}                               pr
${XPAND_ABBR}                                         xp
${COLUMNSTORE_ABBR}                                   cs
${SERVERLESS_ABBR}                                    sa
&{TOPOLOGY_ABBR_DICT}                                 Single=${STANDALONE_ABBR}
...                                                   Replica=${PRIMARY_REPLICA_ABBR}
...                                                   Distributed=${XPAND_ABBR}
...                                                   ColumnStore=${COLUMNSTORE_ABBR}
...                                                   Serverless=${SERVERLESS_ABBR}

*** Keywords ***

Calculate DB time for launching
    [Documentation]  Calculating time between DB Launch and DB Healthy status

    ${stop} =  Get Current Date

    # ${start} variable is passed from 'LaunchServiceDetailsKeywords.robot' file -> 'Click on Launch Service button' keyword
    ${diff} =  Subtract Date From Date    ${stop}    ${start}

    ${diff_converted} =  Convert Time    ${diff}    result_format=compact

    log to console    "Database becomes healthy for: ${diff_converted}"

Input service name
    [Documentation]    Generate service name
    [Arguments]    ${topology}

    ${maxscale} =         Evaluate   'MaxScale' in '${TEST_NAME}'
    ${disabled_ssl} =     Evaluate   'DisabledSSL' in '${TEST_NAME}'
    ${apply_new} =        Evaluate   'ApplyNew' in '${TEST_NAME}'
    ${apply_previous} =   Evaluate   'ApplyPrevious' in '${TEST_NAME}'

    ${suffix} =    Set Variable        ${EMPTY}
    ${suffix} =    Set Variable If    '${maxscale}' == 'True'          -mxs      ${EMPTY}
    ${suffix} =    Set Variable If    '${disabled_ssl}' == 'True'      -dssl     ${suffix}
    ${suffix} =    Set Variable If    '${apply_new}' == 'True'         -apln    ${suffix}
    ${suffix} =    Set Variable If    '${apply_previous}' == 'True'    -aplp    ${suffix}

    #generate name for topology (service) name
    ${timestamp} =    Get Current Date  local  exclude_millis=yes  result_format=%d%H%M%S
    ${TOPOLOGY_NAME_VALUE} =    Catenate    mdbint-qa-${TOPOLOGY_ABBR_DICT}[${topology}]${suffix}${timestamp}[1:]

    [Return]    ${TOPOLOGY_NAME_VALUE}

Scroll page by pressing the ARROW_DOWN button
    [Documentation]    Scroll page by pressing the ARROW_DOWN button

    FOR    ${i}    IN RANGE    3
        press keys    None    ARROW_DOWN
        # The sleep command below is used to ensure userlike behaviour with enough time interval between each key press.
        # Otherwise, if the keys are pressed instantly or too fast, the UI fails to perform the expected scroll action.
        sleep    0.5 sec
    END

    log to console    Scroll page by pressing the ARROW_DOWN button

Validate email is recieved
    [Documentation]    Validate the last email from 'sender' into your email 'Inbox'

    open mailbox    host=imap.gmail.com    user=automatedguitests@gmail.com    password=ilvmsajcxszuaiha    port=993
    Wait For Email    sender=noreply@skysql-test.mariadb.net    timeout=150
    close mailbox

    log to console    Check recieved emails
