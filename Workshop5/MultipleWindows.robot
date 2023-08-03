*** Settings ***
Documentation     Multiple Windows
Library           SeleniumLibrary
Suite Setup       Open Browser      ${url}     ${browser} 
Suite Teardown    Close Browser
Test Setup        Maximize Browser Window

*** Variables ***
${url}            https://the-internet.herokuapp.com/windows
${browser}        Chrome
${link_locator}   xpath=//*[@id="content"]/div/a

*** Test Cases ***
Multiple Windows Test
    Wait Until Page Contains    Opening a new window
    Wait Until Element Is Visible    ${link_locator}
    Click Element    ${link_locator}
    Sleep    2s
