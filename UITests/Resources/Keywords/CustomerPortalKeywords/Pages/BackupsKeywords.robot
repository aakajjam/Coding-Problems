*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../../../../Resources/TestData/VerificationStrings.robot

*** Variables ***
${BACKUPS_SECTION}                    xpath=//div[@class="nav-item custom-click"]//span[text()="Backups"]
${BACKUPS_SECTION_TITLE}              css=.view-headline
${DATA_TABLE}                         css=.v-data-table
${BACKUP_NOW}                         css=[data-test-id="btn-backup-now"]
${NEW_SCHEDULE}                       css=[data-test-id="btn-new-schedule"]
${RESTORE_FROM_EXTERNAL_STORAGE}      css=[data-test-id="btn-external-restore"]
${POINT_IN_TIME_RESTORE}              css=[data-test-id="btn-pitr"]
${BACKUPS_SCHEDULES_RESTORES_TABS}    css=.route-tabs

*** Keywords ***
Click on 'Backups' section and verify elements
    wait until element is visible    ${BACKUPS_SECTION}    timeout=10s    error=Backups section is not visible
    click element    ${BACKUPS_SECTION}
    wait until location contains    service-backups    timeout=10s 
    wait until element is enabled    ${BACKUPS_SCHEDULES_RESTORES_TABS}   timeout=10s   
    wait until element is visible    ${BACKUPS_SECTION_TITLE}    timeout=10s
    ${section_title}=    Get Text    ${BACKUPS_SECTION_TITLE}
    ${section_title}=    Strip String    ${section_title}
    Should Be Equal As Strings    ${section_title}    Backups
    wait until element is visible    ${DATA_TABLE}   timeout=10s       
    wait until element is visible    ${BACKUP_NOW}   timeout=10s

Click on 'Schedules' tab and verify elements
    wait until element is visible    ${BACKUPS_SECTION}    timeout=10s    error=Backups section is not visible
    click element    ${BACKUPS_SECTION}
    wait until location contains    service-backups    timeout=10s 
    wait until element is enabled    ${BACKUPS_SCHEDULES_RESTORES_TABS}   timeout=10s   
    wait until element is visible    ${BACKUPS_SECTION_TITLE}    timeout=10s
    ${section_title}=    Get Text    ${BACKUPS_SECTION_TITLE}
    ${section_title}=    Strip String    ${section_title}
    Should Be Equal As Strings    ${section_title}    Backups
    wait until element is visible   link=${BACKUPS_SCHEDULES_TAB}    timeout=10s
    click link    ${BACKUPS_SCHEDULES_TAB}
    wait until location contains     service-schedules    timeout=10s
    wait until element is visible    ${DATA_TABLE}    timeout=10s 
    wait until element is visible    ${NEW_SCHEDULE}   timeout=10s

Click on 'Restores' tab and verify elements
    wait until element is visible    ${BACKUPS_SECTION}    timeout=10s    error=Backups section is not visible
    click element    ${BACKUPS_SECTION}
    wait until location contains    service-backups    timeout=10s 
    wait until element is enabled    ${BACKUPS_SCHEDULES_RESTORES_TABS}   timeout=10s   
    wait until element is visible    ${BACKUPS_SECTION_TITLE}    timeout=10s
    ${section_title}=    Get Text    ${BACKUPS_SECTION_TITLE}
    ${section_title}=    Strip String    ${section_title}
    Should Be Equal As Strings    ${section_title}    Backups
    wait until element is visible   link=${BACKUPS_RESTORES_TAB}    timeout=10s
    click link    ${BACKUPS_RESTORES_TAB}
    wait until location contains    service-restores   timeout=10s
    wait until element is visible    ${RESTORE_FROM_EXTERNAL_STORAGE}    timeout=10s
    wait until element is visible    ${POINT_IN_TIME_RESTORE}    timeout=10s
    wait until element is visible    ${DATA_TABLE}   timeout=10s