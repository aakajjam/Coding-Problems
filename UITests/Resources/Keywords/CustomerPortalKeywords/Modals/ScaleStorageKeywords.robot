*** Settings ***

Documentation    'Scale Storage' page keywords
Library          SeleniumLibrary
Library          String
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${SCALE_STORAGE_MODAL} =               xpath = //*[contains(@class, 'v-dialog--active')]
${IOPS_INPUT} =                        xpath = //*[contains(@class, 'v-dialog--active')]//input[@type = 'number']
${APPLY_CHANGES_BUTTON} =              xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes')]
${CANCEL_BUTTON} =                     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Cancel')]
${APPLY_CHANGES_BUTTON_DISABLED} =     xpath = //*[contains(@class, 'v-dialog--active')]//button[contains(.,'Apply Changes') and @disabled='disabled']
${STORAGE_DRAGGED_ELEMENT} =           xpath = //*[contains(@class, 'v-dialog--active')]//*[@class='v-slider__thumb']
${STORAGE_CURRENT_VALUE} =             xpath = (//*[contains(@class, 'v-dialog--active')]//*[@data-auto='unit-label'])[2]

*** Keywords ***

Verify page title is 'Scale Storage'
    [Documentation]    Check the page title is 'Scale Storage'

    wait until element is visible    ${SCALE_STORAGE_MODAL}    15s    error = 'Scale Storage' modal is not visible!

    # ${SCALE_STORAGE_EXPECTED_TITLE} variable is passed from 'VerificationStrings.robot' file
    element should contain    ${SCALE_STORAGE_MODAL}    ${SCALE_STORAGE_EXPECTED_TITLE}

    log to console    Verify page title is 'Scale Storage'

Select number of IOPS
    [Arguments]    ${iops_altered}
    [Documentation]    Select the desired number of IOPS

    wait until element is visible    ${IOPS_INPUT}    15s    error = 'IOPS input' field is not visible on the 'Scale Storage' page!

    input text    ${IOPS_INPUT}    ${IOPS_ALTERED}

    log to console    Select number of IOPS

Click 'Apply changes' button
    [Documentation]    Click the 'Apply changes' button

    wait until element is visible    ${APPLY_CHANGES_BUTTON}    15s    error = 'Apply changes' button is not visible on the 'Scale Storage' page!
    click element    ${APPLY_CHANGES_BUTTON}

    log to console    Click 'Apply changes' button

Click 'Cancel' button
    [Documentation]    Click 'Cancel' button

    wait until element is visible    ${CANCEL_BUTTON}    15s    error = 'Cancel' button is not visible on the 'Scale Storage' page!
    click element    ${CANCEL_BUTTON}

    log to console    Click 'Cancel' button

Verify number of IOPS is correctly displayed
    [Arguments]    ${iops_altered}    ${storage}
    [Documentation]    Verify number of IOPS is correctly displayed

    ${iops_calculated_number} =    Evaluate    ${iops_altered} * ${storage}
    set test variable    ${IOPS_CALCULATED_NUMBER}

    page should contain    ${iops_calculated_number}

    log to console    Verify number of IOPS is correctly displayed

Verify 'Apply changes' button is disabled
    [Documentation]    Verify 'Apply changes' button is disabled

    wait until element is visible    ${APPLY_CHANGES_BUTTON_DISABLED}    30 sec    error = 'Apply changes' button is still active or not visible on the 'Scale Storage' page!

    log to console    Verify 'Apply changes' button is disabled

Select 'Storage size'
    [Documentation]     Select 'Storage size'
    [Arguments]    ${STORAGE_ALTERED}

    wait until element is visible    ${STORAGE_CURRENT_VALUE}    30 sec
    ${size_raw} =    get text    ${STORAGE_CURRENT_VALUE}
    ${size_trimmed} =    set variable    ${size_raw.strip()}[0:4]
    ${size} =    remove string    ${size_trimmed}    ${SPACE}
    wait until element is visible    ${STORAGE_DRAGGED_ELEMENT}

    click element    ${STORAGE_DRAGGED_ELEMENT}

    WHILE    ${size} != ${STORAGE_ALTERED}    limit= 18
        press keys    None    ARROW_RIGHT
        ${size_raw} =    get text    ${STORAGE_CURRENT_VALUE}
        ${size_trimmed} =    set variable    ${size_raw.strip()}[0:4]
        ${size} =    remove string    ${size_trimmed}    ${SPACE}
    END
    log to console    Select 'Transactional storage size': ${size}

Verify Storage number is correctly displayed
    [Arguments]    ${storage_altered}
    [Documentation]    Verify Storage number is correctly displayed

    page should contain    ${storage_altered}

    log to console    Verify Storage number is correctly displayed
