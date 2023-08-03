*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Variables.robot

*** Keywords ***
Open Web browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data Login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible            ${locator_email}       5s
    Input Text    ${locator_email}           ${email}
    Wait Until Element Is Visible            ${locator_password}
    Input Text                               ${locator_password}    ${password}
    Click Element                            ${locator_btn-login}
    Wait Until Page Contains                 Search Filters    5s

Select List Role
    [Arguments]    ${role}
    Click Element                            ${locator_role}
    Wait Until Element Is Visible            ${locator_select-role${role}}
    Click Element                            ${locator_select-role${role}}

Select List Plan
    [Arguments]    ${plan}
    Click Element                            ${locator_plan}
    Wait Until Element Is Visible            ${locator_select-plan${plan}}
    Click Element                            ${locator_select-plan${plan}}

Select List Status
    [Arguments]    ${status}
    Click Element                            ${locator_status}
    Wait Until Element Is Visible            ${locator_select-status${status}}
    Click Element                            ${locator_select-status${status}}

Click Next and Previous Pages
    [Arguments]    ${locator_btn-search}    ${locator_nextpage}    ${locator_previous}
    Wait Until Page Contains                 Search Filters    5s
    Click Element                            ${locator_btn-search}
    Wait Until Element Is Visible            ${locator_btn-search}
    Execute JavaScript                       window.scrollTo(0, document.body.scrollHeight)
    
    FOR    ${index}    IN RANGE    5
        Wait Until Element Is Visible        ${locator_nextpage}
        Click Element                        ${locator_nextpage}
        Wait Until Page Contains             Search Filters    5s
    END
    
    Wait Until Element Is Visible            ${locator_previous}
    
    FOR    ${index}    IN RANGE    4
        Click Element                        ${locator_previous}
        Wait Until Page Contains             Search Filters    5s
    END

Input Data for add user
    Wait Until Page Contains    Add User        5s
    Click Element    ${locator_adduser} 
    Input Text                            ${locator_firstname}       Theera
    Input Text                            ${locator_lastname}        Onpan
    Input Text                            ${locator_email}           theera@gmail.com
    Input Text                            ${locator_password-add}    123456789
    Input Text                            ${locator_mobile-phone}    0873230296
    Select Radio Button                   ${locator_gender}          male
    Select Checkbox                       ${locator_chksql}
    Select Checkbox                       ${locator_chkmanual}
    Select Checkbox                       ${locator_chkautomate}
    Select List Nationality Add
    Select List Role Add
    Select List Plan Add
    Click Element                         ${locator_btn-adduser}
    Wait Until Page Contains              Register Success           5s
    Click Element                         ${locator_btn-ok}
    Wait Until Page Contains              Search Filters             5s
    Wait Until Element Is Visible         ${locator_logout}
    Click Element                         ${locator_logout}
    Wait Until Element Is Visible         ${locator_click-logout}
    Click Element                         ${locator_click-logout}
    Wait Until Page Contains              Welcome to Kru P' Beam!    5s
    Input Data Login                      theera@gmail.com    123456789

Select List Role Add
    Click Element                         ${locator_select-role}
    Wait Until Element Is Visible         ${locator_select-role-li}
    Click Element                         ${locator_select-role-li}

Select List Nationality Add
    Click Element                         ${locator_nationality}
    Wait Until Element Is Visible         ${locator_selectnational}  
    Click Element                         ${locator_selectnational} 

Select List Plan Add
    Click Element                        ${locator_select-plan}
    Wait Until Element Is Visible        ${locator_select-plan-li}    
    Click Element                        ${locator_select-plan-li}

Input Data for reset
    Wait Until Page Contains    Add User        5s
    Click Element    ${locator_adduser} 
    Input Text                            ${locator_firstname}       Theera
    Input Text                            ${locator_lastname}        Onpan
    Input Text                            ${locator_email}           theera@gmail.com
    Input Text                            ${locator_password-add}    123456789
    Input Text                            ${locator_mobile-phone}    0873230296
    Select Radio Button                   ${locator_gender}    male
    Select Checkbox                       ${locator_chksql}
    Select Checkbox                       ${locator_chkmanual}
    Select Checkbox                       ${locator_chkautomate}
    Select List Nationality Add
    Select List Role Add
    Select List Plan Add
    Execute JavaScript                    window.scrollTo(0, document.body.scrollHeight)
    Click Element                         ${locator_scrolltop}
    Wait Until Element Is Visible         ${locator_reset}
    Click Element                         ${locator_reset}
    Wait Until Element Is Visible         ${locator_btn-back}
    Click Element                         ${locator_btn-back}   

Verify error msg
    [Arguments]    ${locator}    ${errormsg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${errormsg}

Input Data Fail - Test Template
    Open Web browser
    Input Data Login    user.test@krupbeam.com    123456789
    Wait Until Page Contains    Add User        5s
    Click Element    ${locator_adduser}
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${chkbox}    ${nationadd}    ${roleadd}    ${planadd}    ${locator1}    ${msg1}
    Input Text    ${locator_firstname}       ${firstname}
    Input Text    ${locator_lastname}        ${lastname}
    Input Text    ${locator_email}           ${email}
    Input Text    ${locator_password-add}    ${password} 
    Input Text    ${locator_mobile-phone}    ${mobile}
    IF  "${gender}" != "0"
        Select Radio Button    ${locator_gender}    ${gender}        
    END
    
    IF    ${chkbox} == 1
        Select Checkbox    ${locator_chksql}
    ELSE IF    ${chkbox} == 2
        Select Checkbox    ${locator_chkmanual}
    ELSE IF    ${chkbox} == 3
        Select Checkbox    ${locator_chksql}
        Select Checkbox    ${locator_chkmanual}
        Select Checkbox    ${locator_chkautomate}
    ELSE IF    ${chkbox} == 4
        Select Checkbox    ${locator_chksql}
        Select Checkbox    ${locator_chkmanual}
        Select Checkbox    ${locator_chkautomate}
        Select Checkbox    ${locator_chkautomate2}
    END

    IF    ${nationadd} == 1
          Select List Nationality Add
    END

    IF    ${roleadd} == 1
          Select List Role Add
    END

    IF    ${planadd} == 1
          Select List Plan Add
    END

    Click Element    ${locator_btn-adduser}
    Verify error msg    ${locator1}    ${msg1}
    Close Browser

Search Dropdown List
    Open Web browser
    Input Data Login    user.test@krupbeam.com    123456789
    [Arguments]    ${role}    ${plan}    ${status}
    IF  ${role} == 1
    Set Variable    ${locator_select-role1}
    Click Element                            ${locator_role}
    Wait Until Element Is Visible            ${locator_select-role1}
    Click Element                            ${locator_select-role1}
    END

    IF   ${plan} == 1
    Set Variable    ${locator_select-plan1}
    Click Element                            ${locator_plan}
    Wait Until Element Is Visible            ${locator_select-plan1}
    Click Element                            ${locator_select-plan1}
    END

    IF    ${status} == 1
    Set Variable    ${locator_select-status1}
    Click Element                            ${locator_status}
    Wait Until Element Is Visible            ${locator_select-status1}    
    Click Element                            ${locator_select-status1}
    END
    
    Click Element    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_btn-search}
    Click Element    ${locator_btn-clear}
    Wait Until Element Is Visible    ${locator_btn-clear}
    Close Browser
    Set Variable
    
Check more button
    Wait Until Element Is Visible         ${locator_notifications}
    Click Element                         ${locator_notifications}
    Wait Until Element Is Visible         ${locator_read-nati}
    Click Element                         ${locator_read-nati}
    Wait Until Element Is Visible         ${locator_adduser}
    Click Element                         ${locator_adduser}
    Wait Until Element Is Visible         ${locator_navication}
    Click Element                         ${locator_navication}
    Wait Until Element Is Visible         ${locator_logout}
    Click Element                         ${locator_logout}
    Wait Until Element Is Visible         ${locator_click-logout}
    Click Element                         ${locator_click-logout}
    Wait Until Page Contains              Welcome to Kru P' Beam!    5s    