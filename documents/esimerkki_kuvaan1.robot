*** Settings ***
Test Template     valid credentials

*** Test Cases ***                Username           Password           address         email

Valid credentials                   John Ham           ${secret1}       ${address1}     ${email1}
    [Tags]           customer1567
    [Documentation]  good good
Valid credentials                   Kate Cucumber      ${secret2}       ${address1}     ${email2}
    [Tags]           customer2855
    [Documentation]  nice nice
Valid credentials                   Sam Banana         ${secret3}       ${address1}     ${email3}
    [Tags]           customer1567
    [Documentation]  yes yes
Valid credentials                   Pat Potato         ${secret4}       ${address1}     ${email4}
    [Tags]           customer2855
    [Documentation]  no no
Valid credentials                   Thomas Eade        ${secret5}       ${address1}     ${email5}
    [Tags]           non-customer
    [Documentation]  ...
Valid credentials                   Daniel Tomato      ${secret6}       ${address1}     ${email6}
    [Tags]           customer2855
    [Documentation]  true true
Valid credentials                   Christina Melon    ${secret7}       ${address1}     ${email7}
    [Tags]           customer1567
    [Documentation]  false false
Valid credentials                   John Han           ${secret8}       ${address1}     ${email8}
    [Tags]           customer2855
    [Documentation]  some some
Valid credentials                   Riku Simola        ${secret11}      ${address1}     ${email11}
    [Tags]           non-customer
    [Documentation]  ...

*** Keywords ***
Valid credentials
    [Arguments]         ${username}    ${password}    ${address}    ${email}
    example             ${username}    ${password}    ${address}    ${email}

example