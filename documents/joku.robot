*** Settings ***
Library    Browser


*** Test Cases ***

For-Loop-Elements
    @{CUSTOMER1} =  Create List     John Doe    johndoe@email.com 
    @{CUSTOMER2} =  Create List     John Ham    johnham@email.com
    @{CUSTOMER3} =  Create List     John Ham    johnham@email.com
    @{CUSTOMER4} =  Create List     John Ham    johnham@email.com
    @{CUSTOMER5} =  Create List     John Ham    johnham@email.com

    @{LIST} =       Create List    ${CUSTOMER1}    ${CUSTOMER2}
    FOR    ${CUSTOMER}    IN    @{LIST}
            Run Keyword And Continue On Failure    Niin ${CUSTOMER}[0] ${CUSTOMER}[1]     
    END


*** Keywords ***
Niin ${pieni} ${iso}
    Log To Console     ${pieni}
    Log to Console     ${iso}

joo
    sleep    1
jaa
    sleep    1
juu
    Sleep    1