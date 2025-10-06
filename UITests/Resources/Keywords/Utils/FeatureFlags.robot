*** Settings ***

Documentation    Feature Flags Keywords
Library          RequestsLibrary
Library          Collections
Library          ../../../Resources/CustomLibraries/ParseCSVandJSON.py
Resource         ../../TestData/VerificationStrings.robot

*** Keywords ***

Get browser logs
    [Documentation]    Get the browser logs

    ${selenium} =    Get Library Instance    SeleniumLibrary
    ${webdriver} =    Set Variable     ${selenium._drivers.active_drivers}[0]
    ${log_entries} =    Evaluate    $webdriver.get_log('performance')

    set test variable    ${log_entries}

    log to console    Get browser logs

Get current feature flags from the entitlements API
    [Documentation]    Get current feature flags from the entitlements API
    [Arguments]    ${ENV}

    ${bearer_token} =    extract bearer token    ${log_entries}
    &{headers}    Create Dictionary    Authorization=${bearer_token}
    # ${API_SKYSQL_URLS} and ${ENTITLEMENTS_ENDPOINT} are taken from ../../TestData/VerificationStrings.robot
    ${response} =    GET    ${API_SKYSQL_URLS.${ENV}}${ENTITLEMENTS_ENDPOINT}    headers=${headers}
    ${feature_flags_rs} =    set variable    ${response.content}
    set test variable    ${feature_flags_rs}

    log to console    Get current feature flags from the entitlements API: ${feature_flags_rs}

Parse feature flags
    [Documentation]    Parse feature flags

    FOR    ${flag}    IN    &{FEATURE_FLAGS}
        ${contains} =    Evaluate   "${flag}[0]" in str(${feature_flags_rs})
        IF    ${contains} == True
            set to dictionary    ${FEATURE_FLAGS}    ${flag}[0]    ON
        ELSE
            log to console    ${flag}
        END
    END

    log to console    Current feature flags: ${\n}&{FEATURE_FLAGS}

Set current feature flags
    [Documentation]    High level keyword, containing all relative keywords in order to check which feature flags are
    ...    on for the current user. And set their values into an usable dictionary.

    Get browser logs
    Get current feature flags from the entitlements API    ${ENV}
    Parse feature flags

Feature flag 'Single Zone' condition
    [Documentation]    Conditional actions for whether 'enable-portal-single-zone' flag is ON or OFF for the current org_id

    IF    '${FEATURE_FLAGS}[enable-portal-single-zone]' == 'OFF'
        skip    FEATURE_FLAG_ERROR: enable-portal-single-zone feature is disabled for the current org_id and the test scenario cannot be executed!
    END

Feature flag 'Dual Endpoints' condition
    [Documentation]    Conditional actions for whether 'enable-portal-dual-endpoints' flag is ON or OFF for the current org_id

    IF    '${FEATURE_FLAGS}[enable-portal-dual-endpoints]' == 'OFF'
        set test variable    ${SETUP_MANAGE_ALLOWLIST_LABEL}    //*[contains(text(), 'Secure Access')]
    END

Feature flag 'Serverless' condition
    [Documentation]    Conditional actions for whether 'disable-dps-topology-sa' flag is ON or OFF for the current org_id

    IF    '${FEATURE_FLAGS}[disable-dps-topology-sa]' == 'ON'
        skip    FEATURE_FLAG_ERROR: disable-dps-topology-sa feature is disabled for the current org_id and the test scenario cannot be executed!
    END
