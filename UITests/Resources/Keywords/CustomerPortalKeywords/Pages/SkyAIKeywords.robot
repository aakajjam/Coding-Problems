*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library    XML
Library    Collections

*** Variables ***
${SKYAI_AGENTS_TAB}             css=[data-test-id="nav-skyai-agents"]
${SEND_BUTTON}                  css=[data-test-id="btn-send-prompt"]
${TEXT_BOX}                     css=textarea[placeholder="Ask a question or use one of the examples above"]
${PROMPT_CARDS}                 css=.q-cards
${PROMPT_BUTTON}                css=.q-buttons
${SIDEBAR}                      class=sidebar
${RESPONSE_TEXT}                xpath=(//div[contains(@class, 'copilot-message')])[last()]//div[contains(@class, 'message-content')]
${CHAT_WINDOW}                  id=copilot-messages
${CREATE_BUTTON}                css=[data-test-id="btn-create-agent"]
${ADD_BUTTON}                   css=[data-test-id="btn-add-ds"]
${PLUS_ICON}                    css=[data-test-id="btn-new-chat"]
${AGENT_VERSION_BUTTON}         css=[data-test-id="btn-user-settings-menu"]
${ACTIVE_TAB}                   css=.v-tab--active
${AGENT_SINGLE_TURN_LABEL}      css=[data-test-id="sec-agent-single-turn"]
${LLM_MODEL_LABEL}              css=[data-test-id="sec-llm-model"]
${SQL_LIMIT_LABEL}              css=[data-test-id="sec-sql-limit"]
${SAMPLE_CARD}                  css=.v-card--link
${AGENT_DROPDOWN}               css=[data-test-id="copilot-agents-menu"]
${AGENT_SETTINGS}               class=settings-wrapper
${CLOSE_BUTTON}                 css=[data-test-id="btn-user-settings-close"]
${CLEAR_BUTTON}                 css=[data-test-id^="tab-clear-"]
${TAB_MENU_THREE_DOTS}          css=[data-test-id^="tab-menu-"]

*** Keywords ***
Verify SkyAI Agents Tab
    wait until element is visible    ${SKYAI_AGENTS_TAB}
    Click Element    ${SKYAI_AGENTS_TAB}
    Wait Until Location Contains    skyai-agents
    Wait Until Element Is Visible    ${TEXT_BOX}
    Wait Until Element Is Visible    ${SIDEBAR}

    TRY 
        # Verify we can see the sample prompt cards
        Wait Until Element Is Visible    ${PROMPT_CARDS}    timeout=30s
    EXCEPT
        # Verify we are able to see the sample prompt buttons
        Wait Until Element Is Visible    ${PROMPT_BUTTON}    timeout=30s
        Wait Until Element Is Not Visible    ${PROMPT_CARDS}    timeout=30s
    END

Verify Presence of Dropdowns
    # Presence of dropdowns Create and Add Dropdown options
    wait until element is enabled    ${CREATE_BUTTON}
    Wait Until Element Is Enabled    ${ADD_BUTTON}
    Wait Until Element Is Visible    ${CREATE_BUTTON}
    Wait Until Element Is Visible    ${ADD_BUTTON}

    # Presence of dropdowns Agent and Agent Creation Guides
    Wait Until Element Is Visible    ${AGENT_DROPDOWN}    timeout=60s
    Click Element    ${AGENT_DROPDOWN}

Verify and Click Plus icon
    # This opens a new chat window
    Wait Until Element Is Enabled    ${PLUS_ICON}    timeout=30s
    wait until element is visible    ${PLUS_ICON}
    Click Element    ${PLUS_ICON}
    Wait Until Element Is Visible    ${ACTIVE_TAB}
    Wait Until Element Is Visible    ${PROMPT_CARDS}
    Wait Until Element Is Enabled    ${SAMPLE_CARD}
    Wait Until Element Is Visible    ${SAMPLE_CARD}

Click on a Sample Card
    Wait Until Element Is Enabled    ${PROMPT_CARDS}
    Wait Until Element Is Visible    ${PROMPT_CARDS}
    Click Element    ${SAMPLE_CARD}
    ${text}=    Wait Until Keyword Succeeds    5 times    2s    Get Text    ${CHAT_WINDOW}
    Should Not Be Empty    ${text}

Presence of Agent Version
    Wait Until Element Is Enabled    ${AGENT_VERSION_BUTTON}
    Wait Until Element Is Visible    ${AGENT_VERSION_BUTTON}
    Click Element    ${AGENT_VERSION_BUTTON}
    Wait Until Element Is Visible    ${AGENT_SETTINGS}
    Wait until Element is Visible    ${AGENT_SINGLE_TURN_LABEL}
    Wait until Element is Visible    ${LLM_MODEL_LABEL}
    Wait until Element is Visible    ${SQL_LIMIT_LABEL}
    Click Element    ${CLOSE_BUTTON}

Entering Sample Prompts
    # Entering prompts and verifying their prescence in the chat UI
    Wait Until Element Is Enabled    ${TEXT_BOX}
    Wait Until Element Is Visible    ${TEXT_BOX}
    Click Element    ${TEXT_BOX}
    Input Text    ${TEXT_BOX}    "Get Connected - From a Node.js app"
    Wait Until Element Is Enabled    ${SEND_BUTTON}
    Click Element    ${SEND_BUTTON}
    Wait Until Element Is Visible    ${CHAT_WINDOW}
    Element Should Contain    ${CHAT_WINDOW}    "Get Connected - From a Node.js app"

    # Verifying Response is generated
    Wait Until Element Is Visible    ${RESPONSE_TEXT}   timeout=60s
    Element should be visible    ${RESPONSE_TEXT}     timeout=60s
    ${response_text}=    Get Text    ${RESPONSE_TEXT}
    Should Not Be Empty    ${response_text}    timeout=60s
    Log To Console    ${response_text}
    Log    ${response_text}

Clearing Chat History
    ${three_dots_elements}=    Get WebElements    ${TAB_MENU_THREE_DOTS}
    # Get the last three dots button element (hence the -1)
    ${last_dots_element}=    Get From List    ${three_dots_elements}    -1
    Element Should Be Visible    ${last_dots_element}
    Click Element    ${last_dots_element}

    ${clear_button_elements}=    Get WebElements    ${CLEAR_BUTTON}
    # Get the last clear button element (hence the -1)
    ${last_clear_button}=    Get From List    ${clear_button_elements}    -1
    Wait Until Element is Visible    ${last_clear_button}    timeout=30s
    Click Element    ${last_clear_button}

    Wait Until Element Is Enabled    ${PROMPT_CARDS}
    Wait Until Element Is Visible    ${PROMPT_CARDS}