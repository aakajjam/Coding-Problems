*** Settings ***
Library           SeleniumLibrary
Resource    ../../../Resources/Keywords/Utils/CommonKeywords.robot
Resource    ../../../Resources/Keywords/CustomerPortalKeywords/Pages/SkyAIKeywords.robot

Test Setup       Begin Test
Test Teardown    End Test


*** Test Cases ***
Input Sample Prompts
    CommonKeywords.User sign in    ${ENV}    ${USERNAME}    ${PASSWORD}
    SkyAIKeywords.Verify SkyAI Agents Tab
    SkyAIKeywords.Verify Presence of Dropdowns
    SkyAIKeywords.Verify and Click Plus icon
    SkyAIKeywords.Click on a Sample Card
    SkyAIKeywords.Presence of Agent Version
    SkyAIKeywords.Entering Sample Prompts
    SkyAIKeywords.Clearing Chat History