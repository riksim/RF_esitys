*** Settings ***
Library           DataDriver    
Resource          login.resource
Suite Setup       Open browser to login page
Test Template     Login with invalid credentials should fail
Suite Teardown    Close Browser


*** Test Cases ***
Invalid logins    ${username}    ${password}



*** Keywords ***
Login with invalid credentials should fail
    [Arguments]         ${username}    ${password}
    Type in username    ${username}
    Type in password    ${password}
    Submit credentials
    Title Should Be     Error Page
    [Teardown]          Navigate to login page