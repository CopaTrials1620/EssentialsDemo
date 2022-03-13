*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [Documentation]           Test case for creating a new Lead in Salesforce Lightning.
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales
