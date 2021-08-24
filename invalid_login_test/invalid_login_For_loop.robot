*** Settings ***
Resource          login.resource
Suite Setup       Open browser to login page
Suite Teardown    Close Browser


*** Test Cases ***

invalid login
    @{CUSTOMER1} =  Create List     demo        invalid
    @{CUSTOMER2} =  Create List     invalid        mode

    @{LIST} =       Create List    ${CUSTOMER1}    ${CUSTOMER2}
    FOR    ${CUSTOMER}    IN    @{LIST}
            Run Keyword And Continue On Failure    Login with ${CUSTOMER}[0] and ${CUSTOMER}[1] should fail
    END

*** Keywords ***
Login with ${username} and ${password} should fail
    Type in username    ${username}
    Type in password    ${password}
    Submit credentials
    Title Should Be     Error Page
    [Teardown]          Navigate to login page