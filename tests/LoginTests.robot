*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
User Login

    Login With                  rogers@shield.com             pwd123
    User Should Be Logged In
    [Teardown]                  Take Screenshot And Logout

Incorret Password

    Login With              rogers@shield.com                abc987
    Alert Text Should Be    Usuário e/ou senha inválidos.

User not found

    Login With              404@yahoo.com                    abc987
    Alert Text Should Be    Usuário e/ou senha inválidos.

Empty email

    Login With              ${EMPTY}                          abc123
    Alert Text Should Be    Oops. Informe um email válido!

Empty Password

    Login With              rogers@shield.com                   ${EMPTY}
    Alert Text Should Be    Oops. Informe sua senha secreta!

Incorret Email

    Login With              rogers&shield.com                 abc987
    Alert Text Should Be    Oops. Informe um email válido!

