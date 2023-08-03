*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/Variables.robot
Resource          ${CURDIR}/Keyword.robot
Suite Setup       Set Selenium Speed                0.5s
Suite Teardown    Close All Browsers
Test Setup        Open Web browser
Test Teardown     Close Browser

*** Test Cases ***
TC001-Input Data
    [Documentation]    ใช้สำหรับหรอกข้อมูลถูกต้องครบถ้วน
    [Tags]    Test Pass
    Input Dato for register pass


TC002-Reset Data
    [Documentation]    ใช้สำหรับทดสอบกรณีเคลียข้อมูล
    [Tags]    Test 
    Input Dato for register
    Click Element    ${locator_reset}


TC003-Verify case fail
    [Setup]
    [Documentation]    ใช้สำหรับหรอกข้อมูลไม่ครบถ้วน
    [Tags]    Fail
    [Template]    Input Data Fail - Test Template
    ${EMPTY}    อ่อนพันธ์     theera.opn@gmail.com    123456      0873230296    male    1    1    1    1    ${locator_error_firstname}    This field is required
    ธีระ          ${EMPTY}   theera.opn@gmail.com    123456      0873230296    male    1    1    1    1    ${locator_error_lastname}     This field is required
    ธีระ          อ่อนพันธ์    ${EMPTY}                123456      0873230296    male    1    1    1    1    ${locator_error_email}         This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    ${EMPTY}    0873230296    male    1    1    1    1    ${locator_error_password}      This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      ${EMPTY}      male    1    1    1    1    ${locator_error_mobile}        This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      0873230296    0       1    1    1    1    ${locator_error_gender}        This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      0873230296    male    0    1    1    1    ${locator_error_chk}           This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      0873230296    male    1    0    1    1    ${locator_error_nattion}       This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      0873230296    male    1    1    0    1    ${locator_error_role}          This field is required
    ธีระ          อ่อนพันธ์    theera.opn@gmail.com    123456      0873230296    male    1    1    1    0    ${locator_error_plan}          This field is required   
    [Teardown]