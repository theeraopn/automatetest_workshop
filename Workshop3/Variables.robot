*** Variables ***
${url}                        https://automate-test.stpb-digital.com/register/
${browser}                    chrome
${locator_firstname}          id=firstname
${locator_lastname}           id=lastname
${locator_gender}             validation-basic-radio
${locator_chksql}             name=courses.SQL
${locator_select-role}        id=select-role
${locator_select-role-li}     xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_btn-sign-up}        id=btn-sign-up
${locator_reset}              id=reset
${locator_email}              id=email
${locator_password}           id=password
${locator_mobile-phone}       id=mobile-phone
${locator_chkmanual}          courses.Test Manual
${locator_chkautomate}        name=courses.Automate Test
${locator_chkautomate2}       name=courses.Automate Test2
${locator_nationality}        id=nationality
${locator_selectnation}       xpath=//*[@id="menu-"]/div[3]/ul/li[221] 
${locator_select-plan}        id=select-plan
${locator_select-plan2}       xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_btn-ok}             id=btn-ok    
${locator_error_firstname}    id=error-firstname
${locator_error_lastname}     id=error-lastname
${locator_error_email}        id=error-email
${locator_error_password}     id=error-password
${locator_error_mobile}       id=error-mobile-phone
${locator_error_gender}       id=validation-basic-gender
${locator_error_chk}          id=validation-basic-courses
${locator_error_nattion}      id=validation-basic-nationality
${locator_error_role}         id=validation-role
${locator_error_plan}         id=validation-plan