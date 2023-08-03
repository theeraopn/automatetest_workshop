*** Settings ***
Documentation     File Uploader
Library           SeleniumLibrary
Suite Setup       Open Browser      ${url}     ${browser} 
Suite Teardown    Close Browser
Test Setup        Maximize Browser Window

*** Variables ***
${url}                        https://the-internet.herokuapp.com/upload
${browser}                    chrome
${locator_fileupload}         id=file-upload
${locator_btn-upload}         id=file-submit
${locator_file-to-upload}     simple.png

*** Test Cases ***
Upload File
    Choose File   ${locator_fileupload}   ${CURDIR}${/}${locator_file-to-upload} 
    Click Button  ${locator_btn-upload}
    Page Should Contain  File Uploaded!
    Sleep   0.5s
