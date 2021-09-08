*Settings*
Documentation    Login Actions

*Keywords*
Login With
    [Arguments]    ${email}    ${paaa}

    Fill Text    css=input[placeholder$=email]      ${email}
    Fill Text    css=input[placeholder*="senha"]    ${paaa}
    Click        text=Entrar

User Should Be Logged In
    Wait For Elements State    css=.dashboard    visible    5    Login error

Alert Text Should Be
    [Arguments]    ${expect_message}

    ${element}                 Set Variable    css=.alert
    Wait For Elements State    ${element}      visible       5
    Get Text                   ${element}      equal         ${expect_message}