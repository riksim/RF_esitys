*** Settings ***   
Documentation                    Test the employee Python script, data driven approach
Resource                         ./data/employee.resource

*** Test Cases ***
Empty Employees List           
    [Documentation]              Verify the output of an empty employees list
    [Setup]                      Clear Employees List
    ${output} =                  Retrieve Employees List
    Should Be Equal              ${output}        []

Add Employee                   
    [Documentation]              Verify adding an employee
    [Template]                   Add Employee Template
    first_name=John              last_name=Doe
    first_name=Monty             last_name=Python
    first_name=Knight            last_name=Ni

*** Keywords ***              
Add Employee Template          
    [Documentation]              Template for verifying adding an employee                            
    [Arguments]                  ${first_name}    ${last_name}

    Clear Employees List
    Add Employee                 first_name=${first_name}  last_name=${last_name}
    ${output} =                  Retrieve Employees List
    Should Be Equal              ${output}        ['${first_name} ${last_name}']
    [Teardown]                   Clear Employees List