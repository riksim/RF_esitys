*** Settings ***
Library            SeleniumLibrary

*** Variables ***
${LOGIN URL}             http://localhost:7272
${BROWSER}               Chrome
${VALID_USER}            demo
${VALID_PASSWORD}        mode


*** Keywords ***
Open browser to login page
    Open browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be    Login Page

Type in valid username
    Type in username    ${VALID_USER}

Type in username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
    
Type in valid password
    Type in password    ${VALID_PASSWORD}

Type in password
    [Arguments]    ${password}
    Input Password    password_field    ${password}

Submit credentials
    Click Button    login_button

Welcome page should open
    Title Should Be    Welcome Page

Navigate to login page
    Go To    ${LOGIN URL}