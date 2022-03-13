*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales
    ClickUntil                Recently Viewed             Leads
    ClickUntil                Lead Information            New

    ${leadRunId}              Generate Random String       4    [NUMBERS]
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText     First Name    Tina
    TypeText     Last Name     Smith-${leadRunId}
    Picklist     Lead Status   New
    TypeText     Phone         +12234567858449                  First Name
    TypeText     Company       Growmore                        Company
    TypeText     Title         Manager                        Address Information
    TypeText                  Email                       tina.smith-${leadRunId}@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/
    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off

    Sleep                     1

    ClickText    Details
    VerifyField               Name                        Ms. Tina Smith-${leadRunId}
    VerifyField               Lead Status                 New
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads                      2
    VerifyText                Tina Smith-${leadRunId}
    VerifyText                Manager
    VerifyText                Growmore
