*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                        https://automate-test.stpb-digital.com/register/
${browser}                    chrome
${locator_firstname}          id=firstname
${locator_lastname}           id=lastname
${locator_email}              id=email
${locator_email-error}        id=error-email
${locator_password}           id=password
${locator_password-icon}      id=icon-toggle-show-password
${locator_mobile}             id=mobile-phone
${locator_gender}             validation-basic-radio
${locator_gen_group}          xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]/div
${locator_sql}                name=courses.SQL
${locator_manual}             courses.Test Manual
${locator_test}               name=courses.Automate Test
${locator_test2}              name=courses.Automate Test2
${locator_nationality}        id=nationality
${locator_select-nation}      xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_select-plan}        id=select-plan
${locator_select-plan-li}     //*[@id="menu-"]/div[3]/ul/li[1]
${locator_select-role}        id=select-role
${locator_select-role-li}     xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_btn-sign-up}        id=btn-sign-up
${locator_msg_firstname}      id=error-firstname
${locator_msg_lastname}       id=error-lastname
${locator_msg_email}          id=error-email
${locator_msg_password}       id=error-password
${locator_msg_mobile}         id=error-mobile-phone
${locator_msg_gender}         id=validation-basic-gender
${locator_msg_course}         id=validation-basic-courses
${locator_msg_nattion}        id=validation-basic-nationality
${locator_msg_role}           id=validation-role
${locator_msg_plan}           id=validation-plan
${locator_reset}              id=reset
${locator_btn-ok}             id=btn-ok 
${locator_hyperlink}          xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a

*** Keywords ***
Open Web browser
    Set Selenium Speed                                               0.5s
    Open Browser                           ${url}    ${browser}
    Wait Until Page Contains                                         Kru P' Beam    
    Maximize Browser Window

Input Data for register
    Input Text                             ${locator_firstname}       Theera    
    Input Text                             ${locator_lastname}        Onpan
    Input Text                             ${locator_email}           theera.opn@gmail.com
    Input Text                             ${locator_password}        1234567890 
    Click Element                          ${locator_password-icon}
    Wait Until Element Is Visible          ${locator_password-icon}
    Click Element                          ${locator_password-icon}
    Input Text                             ${locator_mobile}          0819728644
    Select Radio Button                    ${locator_gender}          male
    Select Checkbox                        ${locator_sql}
    Select Checkbox                        ${locator_manual}
    Select Checkbox                        ${locator_test}
    Select Checkbox                        ${locator_test2}
    Select List
    Scroll Element Into View               ${locator_btn-sign-up}
    Wait Until Element Is Visible          ${locator_btn-sign-up}
    Click Element                          ${locator_btn-sign-up}
    Wait Until Page Contains               Register Success           
    Click Element                          ${locator_btn-ok}
    Wait Until Page Contains               Welcome to Kru P' Beam!    

Select List
    Click Element                          ${locator_nationality}
    Wait Until Element Is Visible          ${locator_select-nation}
    Click Element                          ${locator_select-nation}
    Click Element                          ${locator_select-role}
    Wait Until Element Is Visible          ${locator_select-role-li}
    Click Element                          ${locator_select-role-li}
    Click Element                          ${locator_select-plan}
    Wait Until Element Is Visible          ${locator_select-plan-li}
    Click Element                          ${locator_select-plan-li}

Input Email-Fail
    Wait Until Element Is Visible         ${locator_email}
    Input Text                            ${locator_email}             theeragmail.com
    Scroll Element Into View              ${locator_btn-sign-up}
    Wait Until Element Is Visible         ${locator_btn-sign-up}
    Click Element                         ${locator_btn-sign-up}
    Wait Until Element Is Visible         ${locator_email-error}
    ${txt}    Get Text                    ${locator_email-error}
    Should Be Equal As Strings            ${txt}                       Invalid email address 

Input Data for required field
    Wait Until Element Is Visible          ${locator_firstname}
    Wait Until Element Is Visible          ${locator_lastname}
    Wait Until Element Is Visible          ${locator_email}
    Wait Until Element Is Visible          ${locator_password}
    Wait Until Element Is Visible          ${locator_mobile}
    Input Text                             ${locator_firstname}    ${EMPTY} 
    Input Text                             ${locator_lastname}     ${EMPTY}
    Input Text                             ${locator_email}        ${EMPTY}
    Input Text                             ${locator_password}     ${EMPTY}
    Input Text                             ${locator_mobile}       ${EMPTY}
    Radio Button Should Not Be Selected    ${locator_gender}
    Checkbox Should Not Be Selected        ${locator_sql}    
    Click Element                          ${locator_btn-sign-up}
    Wait Until Element Is Visible          ${locator_msg_firstname}
    ${f}=    Get Text                      ${locator_msg_firstname}
    Wait Until Element Is Visible          ${locator_msg_lastname}
    ${l}=    Get Text                      ${locator_msg_lastname}
    Wait Until Element Is Visible          ${locator_msg_email}
    ${e}=    Get Text                      ${locator_msg_email}
    Wait Until Element Is Visible          ${locator_msg_password}
    ${pw}=    Get Text                     ${locator_msg_password}
    Wait Until Element Is Visible          ${locator_msg_mobile}
    ${m}=    Get Text                      ${locator_msg_mobile}
    Wait Until Element Is Visible          ${locator_msg_gender}
    ${g}=    Get Text                      ${locator_msg_gender}
    Wait Until Element Is Visible          ${locator_msg_course}
    ${c}=    Get Text                      ${locator_msg_course}
    Wait Until Element Is Visible          ${locator_msg_nattion}
    ${n}=    Get Text                      ${locator_msg_nattion}
    Wait Until Element Is Visible          ${locator_msg_role}
    ${r}=    Get Text                      ${locator_msg_role}
    Wait Until Element Is Visible          ${locator_msg_plan}
    ${p}=    Get Text                      ${locator_msg_plan}
    Should Be Equal As Strings             ${f}    This field is required
    Should Be Equal As Strings             ${l}    This field is required
    Should Be Equal As Strings             ${e}    This field is required
    Should Be Equal As Strings             ${pw}   This field is required
    Should Be Equal As Strings             ${m}    This field is required
    Should Be Equal As Strings             ${g}    This field is required
    Should Be Equal As Strings             ${c}    This field is required
    Should Be Equal As Strings             ${n}    This field is required
    Should Be Equal As Strings             ${r}    This field is required
    Should Be Equal As Strings             ${p}    This field is required

Input Data for reset
    Input Text                             ${locator_firstname}       Theera    
    Input Text                             ${locator_lastname}        Onpan
    Input Text                             ${locator_email}           theera.opn@gmail.com
    Input Text                             ${locator_password}        1234567890
    Input Text                             ${locator_mobile}          0819728644
    Select Radio Button                    ${locator_gender}          male
    Select Checkbox                        ${locator_sql}
    Select Checkbox                        ${locator_manual}
    Select Checkbox                        ${locator_test}
    Select Checkbox                        ${locator_test2}
    Select List
    Click Element                          ${locator_reset}
    Wait Until Page Contains               Kru P' Beam                

Sign in instead
    Scroll Element Into View               ${locator_hyperlink}
    Wait Until Element Is Visible          ${locator_hyperlink}
    Click Element                          ${locator_hyperlink}
    Wait Until Page Contains               Welcome to Kru P' Beam!        

*** Test Cases ***
TC-1 Open Default Page
    Open Web browser
    Wait Until Page Contains             Kru P' Beam
    Wait Until Element Is Visible        ${locator_reset}
    Wait Until Element Is Visible        ${locator_firstname}
    Wait Until Element Is Visible        ${locator_lastname}
    Wait Until Element Is Visible        ${locator_email}
    Wait Until Element Is Visible        ${locator_password}
    Wait Until Element Is Visible        ${locator_mobile}
    Wait Until Element Is Visible        ${locator_gen_group}
    Wait Until Page Contains             SQL
    Wait Until Page Contains             Test Manual
    Wait Until Page Contains             Automate Test
    Wait Until Page Contains             Automate Test2
    Wait Until Element Is Visible        ${locator_nationality}
    Wait Until Element Is Visible        ${locator_select-role}
    Wait Until Element Is Visible        ${locator_select-plan}
    Close Browser

TC-2 Input data for register
    Open Web browser
    Input Data for register
    Close Browser

TC-3 Input Email data - fail
    Open Web browser
    Input Email-Fail
    Close Browser

TC-4 Input data for required field
    Open Web browser
    Input Data for required field
    Close Browser
    

TC-5 Reset data
    Open Web browser
    Input Data for reset
    Close Browser

TC-6 Hyperlink Sign in instead
    Open Web Browser
    Sign in instead
    Close Browser