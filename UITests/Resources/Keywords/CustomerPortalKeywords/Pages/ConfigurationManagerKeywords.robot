*** Settings ***
Documentation    Configuration Manager Page Keywords
Library          SeleniumLibrary
Library          String
Library          ExcelLibrary
Library          Collections
Library          ../../../CustomLibraries/ParseCSVandJSON.py
Resource         ../../../TestData/VerificationStrings.robot

*** Variables ***

${CONFIGURATION_MANAGER_PAGE_TITLE}                     xpath = //*[contains(@class, 'expand-arrow')]//..//..//*
${CONFIGS_TABLE}                                        xpath = //td[contains(text(), 'SkySQL')]
${CREATE_NEW_BUTTON}                                    xpath = //*[contains(text(),' Create New ')]
${SAVED_CONFIG_ROW_ENTRY_NAME}                          xpath = //td[text()=' {} ']
${SAVED_CONFIG_ROW_ENTRY_OPTIONS}                       xpath = //td[text()=' {} ']//..//*[@role='button']
${DELETE_CONFIG_OPTION}                                 xpath = //*[text()='Delete config']
${DUPLICATE_OPTION}                                     xpath = //*[text()='Duplicate']
${SKYSQL_DEFAULT_CONFIG_LINK}                           xpath = //*[contains(text(),'Saved Configuration')]//..//..//..//*[text()=' {} ']
${EXCLAMATION_MARK_ICON}                                xpath = //*[contains(@class,'orange--text')]
${CONFIGS_TABLE_VARIABLE_VALUE}                         xpath = (//*[text()=' {} ']//..//..//td)[3]

*** Keywords ***
Verify the page is 'Configuration Manager'
    [Documentation]    Verify the page is 'Configuration Manager'

    wait until element is visible     ${CONFIGURATION_MANAGER_PAGE_TITLE}    15s    error = 'Configuration Manager' title is not displayed on 'Configuration Manager' page!
    element text should be    ${CONFIGURATION_MANAGER_PAGE_TITLE}    ${CONFIGURATION_MANAGER_TEXT}

    set test variable    ${CONFIGURATION_MANAGER_PAGE_TITLE}

    log to console    Verify the page is 'Configuration Manager'

Verify default configurations are present
    [Documentation]    Verify default configurations are present

    wait until element is visible    ${CONFIGS_TABLE}    15 sec    error = Configs table is not displayed!
    FOR    ${config}     IN    @{DEFAULT_CONFIGS_LIST}
        page should contain    ${config}
        log to console    '${config}' is present.
    END

    log to console    Verify default configurations are present.

Click on 'Create New' button
    [Documentation]    Click on the 'Create New' button on 'Cofiguration Manager' page

    wait until element is visible     ${CREATE_NEW_BUTTON}    5s    error = 'Create New' button is not displayed on the 'Configuration manager' page!
    click element    ${CREATE_NEW_BUTTON}

    log to console    Click on 'Create New' button

Verify the newly created config is part of 'Saved configurations' list
    [Documentation]    Verify the newly made config is successfully populated in the list with existing 'Saved configurations'

    #  ${NEW_CONFIGURATION_NAME_VALUE} is a test variable taken from 'NewDatabaseConfigurationKeywords.Input configuration name'
    ${formatted_locator_saved_config_row_entry_name} =    format string    ${SAVED_CONFIG_ROW_ENTRY_NAME}    ${NEW_CONFIGURATION_NAME_VALUE}
    wait until element is visible    ${formatted_locator_saved_config_row_entry_name}    15 sec    error = The saved config name is not displayed on the 'Configuration manager' page!
    capture page screenshot

    log to console    Verify the newly created config is part of 'Saved configurations' list - '${NEW_CONFIGURATION_NAME_VALUE}'

Select the desired custom config
    [Documentation]    Select the desired custom config

    #  ${NEW_CONFIGURATION_NAME_VALUE} is a test variable taken from 'NewDatabaseConfigurationKeywords.Input configuration name'
    ${formatted_locator_saved_config_row_entry_name} =    format string    ${SAVED_CONFIG_ROW_ENTRY_NAME}    ${NEW_CONFIGURATION_NAME_VALUE}
    wait until element is visible    ${formatted_locator_saved_config_row_entry_name}    15 sec    error = The saved config name is not displayed on the 'Configuration manager' page!

    click element    ${formatted_locator_saved_config_row_entry_name}

    log to console    Select the desired custom config

Click on the 'Delete config' option for the newly created config
    [Documentation]   While on 'Saved configurations' list the user clicks on the 'three dots'/options button of the newly created config and selects 'Delete config'

    ${formatted_locator_saved_config_row_entry_options} =    format string    ${SAVED_CONFIG_ROW_ENTRY_OPTIONS}    ${NEW_CONFIGURATION_NAME_VALUE}
    wait until element is visible    ${formatted_locator_saved_config_row_entry_options}    5 sec    error = Config entry's options button is not displayed on the 'Configuration Manager' page!
    click element    ${formatted_locator_saved_config_row_entry_options}

    wait until element is visible    ${DELETE_CONFIG_OPTION}    5 sec    error = Delete config option is not displayed on the 'Configuration Manager' page!
    click element    ${DELETE_CONFIG_OPTION}

    log to console    Click on the 'Delete config' option for the newly created config

Verify configuration is not present anymore
    [Documentation]    Verify configuration is deleted successfully

    #  ${NEW_CONFIGURATION_NAME_VALUE} is a test variable taken from 'NewDatabaseConfigurationKeywords.Input configuration name'
    wait until page does not contain    ${NEW_CONFIGURATION_NAME_VALUE}    15s    error = '${NEW_CONFIGURATION_NAME_VALUE}' is still present in the 'Configuration Manager' page!

    log to console    Verify configuration is not present anymore - '${NEW_CONFIGURATION_NAME_VALUE}'

Select from 'Saved Configurations' - SkySQL Default
    [Arguments]    ${default_topology_name}
    [Documentation]    Click on the default topology config link on the 'Cofiguration Manager' page

    # ${default_topology_name} is passed from the argument files. For example it could be - 'ColumnStore' or 'Replica' or 'Single'.
    # ${TOPOLOGY_DEFAULT_CONFIG_DICT} is taken from 'Resources/TestData/VerificationStrings.robot'.
    # The below variable takes the value for the ${default_topology_name} key from the ${TOPOLOGY_DEFAULT_CONFIG_DICT} dictionary.
    ${formatted_locator_skysql_default_config_link} =  format string  ${SKYSQL_DEFAULT_CONFIG_LINK}  ${TOPOLOGY_DEFAULT_CONFIG_DICT}[${default_topology_name}]

    wait until element is visible     ${formatted_locator_skysql_default_config_link}    15s    error = '${TOPOLOGY_DEFAULT_CONFIG_DICT}[${default_topology_name}]' link is not displayed in the 'Cofiguration Manager' page!
    click element    ${formatted_locator_skysql_default_config_link}

    log   Selected '${TOPOLOGY_DEFAULT_CONFIG_DICT}[${default_topology_name}]'
    log to console    Click on 'SkySQL Default' link

Read and list all the config variables and their default values from the csv file
    [Arguments]    ${TOPOLOGY}
    [Documentation]    Reads and lists all the config variable:value pairs for given topology.
    ...    The authoritative Google sheet with config manager data is saved as '.csv' file.

    # This dictionary links the default_topology_name to the respective column name of the .csv file.
    &{topology_to_csv_column_link_dict} =    create dictionary     Single=SNT
    ...                                                            Replica=RT
    ...                                                            ColumnStore=MNA
    ...                                                            Distributed=Xpand

    &{variable_value_dict}    parse csv file    ${topology_to_csv_column_link_dict}[${TOPOLOGY}]

    set test variable    ${variable_value_dict}
    log to console    ${variable_value_dict}
    ${length_of_list} =    get length    ${variable_value_dict}
    log to console    ${length_of_list} variable value pairs in the source sheet

Compare the variables from the sheet and from the UI are the same
    [Arguments]    ${TOPOLOGY}
    [Documentation]    Validates that all the variable value pairs taken from the google sheet are displayed in the UI

    wait until page contains element    ${EXCLAMATION_MARK_ICON}    15 sec    error = The page does not contain the 'Exclamation mark' icon!

    ${missing_variables} =    create list
#    &{variable_value_dict} comes from 'Read and list all the config variables and their default values from the csv file' keyword.
    FOR    ${variable_value_pair}     IN    &{variable_value_dict}
        TRY
            ${configs_table_variable_value_formatted} =    format string    ${CONFIGS_TABLE_VARIABLE_VALUE}    ${variable_value_pair}[0]
            element text should be    ${configs_table_variable_value_formatted}    ${variable_value_pair}[1]
            ...    message = The value in the UI does not match the value in the CSV!
        EXCEPT
            log to console    '${variable_value_pair}' not found in the UI.
            append to list    ${missing_variables}    ${variable_value_pair}
        END
    END

    ${missing_variables_count} =    get length    ${missing_variables}
    IF    ${missing_variables_count} > 0
        fail    These ${missing_variables_count} variable value pairs are missing from the UI: ${missing_variables}
    END

    log to console    Note that for 'sql_mode', 'log_slow_filter' and 'session_track_system_variables'  the default values in the UI are 4/10/5 selected.
    ...    So the test is verifying this, as the actual default value is too long and is not displayed.
    log to console    Compare the variables from the sheet and from the UI are the same - '${TOPOLOGY_DEFAULT_CONFIG_DICT}[${TOPOLOGY}]'

Click on the three dots options button for the desired config
    [Documentation]   Click on the 'three dots'/options button of the newly created config

    ${formatted_locator_saved_config_row_entry_options} =    format string    ${SAVED_CONFIG_ROW_ENTRY_OPTIONS}    ${NEW_CONFIGURATION_NAME_VALUE}
    wait until element is visible    ${formatted_locator_saved_config_row_entry_options}    5 sec    error = Config entry's options button is not displayed on the 'Configuration Manager' page!
    click element    ${formatted_locator_saved_config_row_entry_options}

    log to console    Click on the three dots options button for the desired config

Click the "Duplicate" label option
    [Documentation]    Click the "Duplicate" label option of the three dots menu

    wait until element is visible    ${DUPLICATE_OPTION}    5 sec    error = "Duplicate" option is not displayed on the 'Configuration Manager' page!
    click element    ${DUPLICATE_OPTION}

    log to console    Click the "Duplicate" label option
