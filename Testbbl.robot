*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}                    https://www.bualuang.co.th/page/509/open_acct/?lg=th
${browser}                gc
${locator_cookie}         id=gdpr-message-cookie-consent
${locator_name}           id=thname
${locator_surname}        id=thsurname
${locator_mobile}         id=input29
${locator_email}          id=Email
${locator_showretype}     xpath=//*[@id="txt_box_Email"]/div
${locator_retypeemail}    id=RetypeEmail
${locator_cardID}         id=input5
${locator_money}          id=input143
${locator_flag}           id=pdpaFlag
${locator_btn-submit}     id=btn_submit_openAccount
${screenshot_path}        /path/to/save/screenshot.png

*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data Open Account
    Wait Until Element Is Visible            ${locator_cookie}
    Click Element                            ${locator_cookie}
    Wait Until Element Is Visible            ${locator_name}
    Input Text                               ${locator_name}             ธาริน
    Input Text                               ${locator_surname}          งามขวัญ
    Input Text                               ${locator_mobile}           0879564526
    Input Text                               ${locator_email}            tharrin@gmail.com
    Click Element                            ${locator_showretype}
    Input Text                               ${locator_retypeemail}      tharrin@gmail.com
    Input Text                               ${locator_cardID}           0910196328740
    Wait Until Element Is Visible            ${locator_money}
    Select From List By Value                ${locator_money}            < 1,000,000
    Wait Until Element Is Visible            ${locator_flag}
    Click Element                            ${locator_flag}
    Wait Until Element Is Visible            ${locator_btn-submit}
    Click Element                            ${locator_btn-submit}
    Capture Page Screenshot                  ${screenshot_path}

*** Test Cases ***
Test Open Account BBL
    Open Web Browser
    Input Data Open Account
    Close Browser
