*** Settings ***
Resource          login.resource
Suite Setup       Open browser to login page
Suite Teardown    Close Browser


*** Test Cases ***

# LUO LISTAN KÄYTTÄJÄTUNNUKSISTA JA SALASANOISTA
invalid login
    @{INVALID1} =  Create List     demo        invalid
    @{INVALID2} =  Create List     invalid        mode
    @{INVALID3} =  Create List     demo        ${EMPTY}
    @{INVALID4} =  Create List     ${EMPTY}         mode
    @{INVALID5} =  Create List     ${EMPTY}         mode
# Tähän hajoaa, jos ei ole RUN KEYWORD AND CONTINUE ON FAILURE
    @{INVALID7} =  Create List     demo        mode
    @{INVALID6} =  Create List     demo        ${EMPTY}


# LUO LISTAN YLLÄOLEVISTA LISTOISTA
    @{LIST} =       Create List    ${INVALID1}    ${INVALID2}    ${INVALID3}    ${INVALID4}    ${INVALID5}     ${INVALID7}       ${INVALID6}    

#KÄY LÄPI LISTAT
    FOR    ${INVALID}    IN    @{LIST}
            Run Keyword And Continue On Failure       Login with ${INVALID}[0] and ${INVALID}[1] should fail
    END

*** Keywords ***
Login with ${username} and ${password} should fail
    Type in username    ${username}
    Type in password    ${password}
    Submit credentials
    Title Should Be     Error Page
    [Teardown]          Navigate to login page