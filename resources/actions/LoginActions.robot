*Settings*
Documentation    Login Actions

*Keywords*
Login With
    [Arguments]    ${email}    ${paaa}

    Fill Text    css=input[placeholder$=email]      ${email}
    Fill Text    css=input[placeholder*="senha"]    ${paaa}
    Click        text=Entrar

Do Logout
    Click    css=.do-Logout

User Should Be Logged In
    Wait For Elements State    css=.dashboard    visible    5    Login error

