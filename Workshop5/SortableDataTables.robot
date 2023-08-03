*** Settings ***
Documentation       Sortable Data Tables
Library             SeleniumLibrary
Library             Collections     
Test Setup          Open Web browser
Test Teardown       Close Browser

*** Variables ***
${url}                  https://the-internet.herokuapp.com/tables
${browser}              chrome
${locator_table1}       xpath=//*[@id="table1"]/thead/tr/th[1]
${locator_table2}       xpath=//*[@id="table2"]/thead/tr/th[1]
${locator_tb1-data}     xpath=//table[@id='table1']//tr/td[1]
${locator_tb2-data}     xpath=//table[@id='table2']//tr/td[1]

*** Keywords ***
Open Web browser
    Set Selenium Speed    0.5s
    Open Browser          ${url}    ${browser}
    Maximize Browser Window

Get Table Column Data
    [Arguments]    ${locator}
    ${elements}    Get WebElements    ${locator}
    ${column_data}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Append To List    ${column_data}    ${text}
    END
    [Return]    ${column_data}

*** Test Cases ***
Test_Sort_List_Table1
    [Documentation]    ใช้สำหรับทดสอบกรณีเรียงข้อมูลตารางที่ 1 จากน้อย-มาก และมาก-น้อย
    [Tags]    Table1
    # Ascending
    Click Element    ${locator_table1}
    ${table1_data_asc}    Get Table Column Data     ${locator_tb1-data} 
    Log    Table 1 (Asc): ${table1_data_asc}
    # Descending  
    Click Element    ${locator_table1}
    ${table1_data_desc}    Get Table Column Data    ${locator_tb1-data}
    Log    Table 1 (Desc): ${table1_data_desc}

Test_Sort_List_Table2
    [Documentation]    ใช้สำหรับทดสอบกรณีเรียงข้อมูลตารางที่ 2 จากน้อย-มาก และมาก-น้อย
    [Tags]    Table2
    # Ascending
    Click Element    ${locator_table2} 
    ${table2_data_asc}    Get Table Column Data     ${locator_tb2-data}
    Log    Table 2 (Asc): ${table2_data_asc}
    # Descending  
    Click Element    ${locator_table2} 
    ${table2_data_desc}    Get Table Column Data    ${locator_tb2-data}
    Log    Table 2 (Desc): ${table2_data_desc}
    