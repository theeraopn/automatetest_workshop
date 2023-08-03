*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Variables.robot

*** Keywords ***
Open Web browser
    Set Selenium Speed                                          0.5s
    Open Browser                     ${url}    ${browser}
    Wait Until Page Contains                                    Kru P' Beam    5s
    Maximize Browser Window

Input Dato for register pass
    Input Text                            ${locator_firstname}        Theera
    Input Text                            ${locator_lastname}         Onpan
    Input Text                            ${locator_email}            theera@gmail.com
    Input Text                            ${locator_password}         123456789
    Input Text                            ${locator_mobile-phone}     0873230296
    Select Radio Button                   ${locator_gender}           male
    Select Checkbox                       ${locator_chksql}
    Select Checkbox                       ${locator_chkmanual}
    Select Checkbox                       ${locator_chkautomate}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                          ${locator_btn-sign-up}
    Wait Until Page Contains               Register Success           5s
    Click Element                          ${locator_btn-ok}
    Wait Until Page Contains               Welcome to Kru P' Beam!    5s
    Wait Until Element Is Visible          ${locator_email}

Select List Role
    Click Element    ${locator_select-role}
    Wait Until Element Is Visible    ${locator_select-role-li}
    Click Element    ${locator_select-role-li}

Select List Nationality
    Click Element    ${locator_nationality}
    Wait Until Element Is Visible    ${locator_selectnation}    5s
    Click Element    ${locator_selectnation}

Select List Plan
    Click Element    ${locator_select-plan}
    Wait Until Element Is Visible    ${locator_select-plan2}    5s
    Click Element    ${locator_select-plan2}

Input Dato for register
    Input Text                            ${locator_firstname}        Theera
    Input Text                            ${locator_lastname}         Onpan
    Input Text                            ${locator_email}            theera@gmail.com
    Input Text                            ${locator_password}         123456789
    Input Text                            ${locator_mobile-phone}     0873230296
    Select Radio Button                   ${locator_gender}           male
    Select Checkbox                       ${locator_chksql}
    Select Checkbox                       ${locator_chkmanual}
    Select Checkbox                       ${locator_chkautomate}
    Select List Nationality
    Select List Role
    Select List Plan

Input Data Fail - Test Template
    Open Web browser
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${chkbox}    ${nation}    ${role}    ${plan}    ${locator}    ${msg}
    Input Text    ${locator_firstname}    ${firstname}
    Input Text    ${locator_lastname}    ${lastname}
    Input Text    ${locator_email}    ${email}
    Input Text    ${locator_password}    ${password} 
    Input Text    ${locator_mobile-phone}    ${mobile}

    IF  "${gender}" != "0"
        Select Radio Button    ${locator_gender}    ${gender}        
    END
    

    IF  ${chkbox} == 1
        Select Checkbox    ${locator_chksql}

    ELSE IF  ${chkbox} == 2
        Select Checkbox    ${locator_chkmanual}
    
    ELSE IF  ${chkbox} == 3
        Select Checkbox    ${locator_chksql}
        Select Checkbox    ${locator_chkmanual}
        Select Checkbox    ${locator_chkautomate}
    
    ELSE IF  ${chkbox} == 4
        Select Checkbox    ${locator_chksql}
        Select Checkbox    ${locator_chkmanual}
        Select Checkbox    ${locator_chkautomate}
        Select Checkbox    ${locator_chkautomate2}
    END
    
    IF  ${nation} == 1
        Select List Nationality
    END
    
    IF  ${role} == 1
        Select List Role
    END
    
    IF  ${plan} == 1
        Select List Plan
    END
    
    Click Element    ${locator_btn-sign-up}
    Verify error msg    ${locator}    ${msg}
    Close Browser

Verify error msg
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}