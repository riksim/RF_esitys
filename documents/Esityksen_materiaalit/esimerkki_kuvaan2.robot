*** Settings ***
Test Template     valid credentials

*** Test Cases ***                Username           Password           address         email

Valid credentials                   John Ham           ${secret1}       ${address1}     ${email1}
    [Tags]           customer1567
    [Documentation]  good good
Valid credentials                   Kate Cucumber      ${secret2}       ${address1}     ${email2}
    [Tags]    customer2855
    [Documentation]  nice nice

*** Keywords ***
Valid credentials
    [Arguments]         ${username}    ${password}    ${address}    ${email}
    example             ${username}    ${password}    ${address}    ${email}

example
