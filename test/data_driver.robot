*** Settings ***   
Documentation                    Test the employee Python script, data driven approach
Library                          DataDriver        file=data_driver.csv  dialect=unix
Test Setup                       Clear Employees List
Test Template                    Add Employee Template
Resource                         ./data/employee.resource    

*** Test Cases ***
Add Employee                     ${first_name}     ${last_name}

*** Keywords ***              
Add Employee Template
    [Documentation]              Template for verifying adding an employee
    [Arguments]                  ${first_name}     ${last_name}
    Add Employee                 first_name=${first_name}  last_name=${last_name}
    ${output} =                  Retrieve Employees List
    Should Be Equal              ${output}        ['${first_name} ${last_name}']