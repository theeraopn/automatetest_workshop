*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}                    https://automate-test.stpb-digital.com/
${browser}                chrome
${locator_email}          id=email
${locator_password}       name=password
${locator_btnlogin}       id=btn-login
${locator_msg_email}      css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_password}   css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p    
${locator_hyperlink}      css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a

*** Keywords ***
Open Web browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input data for login page
    Input Text        ${locator_email}        user.test@krupbeam.com
    Input Text        ${locator_password}     123456789
    Click Element     ${locator_btnlogin}

Input data for login page fail
    Input Text        ${locator_email}        admin.test@krupbeam.com
    Input Text        ${locator_password}     123456789
    Click Element     ${locator_btnlogin}

Input data for login page req
    Input Text        ${locator_email}        ${EMPTY}
    Input Text        ${locator_password}     ${EMPTY}
    Click Element     ${locator_btnlogin}

Input data for login page hyper
    Input Text        ${locator_email}        ${EMPTY}
    Input Text        ${locator_password}     ${EMPTY}
    Click Element     ${locator_hyperlink}

*** Test Cases ***
TC001-Showpage
    Open Web browser
    Wait Until Page Contains    Kru P' Beam

TC002-email pass
    Open Web browser
    Input Text       id=email    Beam1234@gmail.com
    Click Element    ${locator_btnlogin}
    Close Browser

TC003-email non format
    Open Web browser
    Input Text                    id=email    Beam1234gmail.com
    Click Element                 ${locator_btnlogin}    
    ${txt}    Get Text            ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email
    Close Browser

TC004-password pass
    Open Web browser
    Input Text        name=password    123456789
    Click Element     ${locator_btnlogin}
    Close Browser

TC005-password non format
    Open Web browser
    Input Text                    name=password    123
    Click Element                 ${locator_btnlogin}
    ${txt}    Get Text            ${locator_msg_password}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters
    Close Browser

TC006-login pass
    Open Web browser
    Input data for login page
    Wait Until Page Contains    Kru P' Beam
    Close Browser

TC007-login fail
    Open Web browser
    Input data for login page fail
    ${txt}    Get Text            ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid
    Close Browser

TC008-button login 
    Open Web browser
    Input data for login page req
    ${txt}    Get Text            ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    email is a required field
    Close Browser

TC009-hyperlink regis
    Open Web browser
    Input data for login page hyper
    Wait Until Page Contains    Kru P' Beam
    Close Browser