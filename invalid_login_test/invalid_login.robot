*** Settings ***
Resource          login.resource
Suite Setup       Open browser to login page
Test Template     Login with invalid credentials should fail
Suite Teardown    Close Browser

    

*** Test Cases ***                Username        Password
# VALID USERNAME
Valid username - invalid pw       ${VALID_USER}    invalid
Valid username - empty pw         ${VALID_USER}    ${EMPTY}
# INVALID USERNAME 
Invalid username - valid pw       invalid         ${VALID_PASSWORD}
Invalid username and pw           invalid         invalid
Invalid username - empty pw       invalid         ${EMPTY}
# EMPTY USERNAME
Empty username - valid pw         ${EMPTY}        ${VALID_PASSWORD}
Empty password                    ${EMPTY}        ${EMPTY}
Empty username- invalid pw        ${EMPTY}        invalid


*** Keywords ***
Login with invalid credentials should fail
    [Arguments]         ${username}    ${password}
    Type in username    ${username}
    Type in password    ${password}
    Submit credentials
    Title Should Be     Error Page
    [Teardown]          Navigate to login page