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

    # Löydetään CSS h1 locatorin avulla.
    Element Text Should Be    tag=h1                    Welcome Page
    Element Text Should Be    css:h1                    Welcome Page
    Element Text Should Be    css:#container h1         Welcome Page
    Element Text Should Be    xpath:/html/body/div/h1   Welcome Page
    Element Text Should Be    //h1                      Welcome Page
    Element Text Should Be    //*[@id= 'container']/h1   Welcome Page

    # Assign variables based on keyword return values
    # and using Builtin keywords for validating them
    ${title} =    Get Title
    Should Be Equal        ${title}    Welcome Page
    Should Start With      ${title}    Welcome
    Should Match           ${title}    Wel* P???
    Should Match Regexp    ${title}    Wel.* P...

    # Named argument syntax
    Should Be Equal        ${title}    WELCOME PAGE    ignore_case=True
    Should Be Equal        first=${title}     ignore_case=True     second=WELCOME PAGE    

Navigate to login page
    Go To    ${LOGIN URL}