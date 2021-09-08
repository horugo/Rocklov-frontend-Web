*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*Test Cases*
User Login

    Fill Text    id=user_email                      rogers@shield.com
    Fill Text    css=input[placeholder*="senha"]    pwd123
    Click        text=Entrar

    Wait For Elements State    css=.dashboard    visible    5    Login error

Incorret Password

    Fill Text    id=user_email                      rogers@shield.com
    Fill Text    css=input[placeholder*="senha"]    abc987
    Click        text=Entrar

    Wait For Elements State    css=.alert    visible    5

    Get Text    css=.alert    equal    Usuário e/ou senha inválidos.

User not found

    Fill Text    id=user_email                      404@yahoo.com
    Fill Text    css=input[placeholder*="senha"]    abc987
    Click        text=Entrar

    Wait For Elements State    css=.alert    visible    5

    Get Text    css=.alert    equal    Usuário e/ou senha inválidos.

Empty email

    Fill Text    id=user_email                      ${EMPTY}
    Fill Text    css=input[placeholder*="senha"]    abc123
    Click        text=Entrar

    Wait For Elements State    css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe um email válido!

Empty Password

    Fill Text    id=user_email                      rogers@shield.com
    Fill Text    css=input[placeholder*="senha"]    ${EMPTY}
    Click        text=Entrar

    Wait For Elements State    css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe sua senha secreta!

Incorret Email

    Fill Text    id=user_email                      rogers&shield.com
    Fill Text    css=input[placeholder*="senha"]    abc987
    Click        text=Entrar

    Wait For Elements State    css=.alert    visible    5

    Get Text    css=.alert    equal    Oops. Informe um email válido!

