*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Test Setup       Start Session
Test Teardown    Finish Session

*Test Cases*
User Login

    LoginPage.Login With                 rogers@shield.com    pwd123
    DashPage.User Should Be Logged In    

Incorret Password

    LoginPage.Login With              rogers@shield.com                abc987
    LoginPage.Alert Text Should Be    Usuário e/ou senha inválidos.    

User not found

    LoginPage.Login With              404@yahoo.com                    abc987
    LoginPage.Alert Text Should Be    Usuário e/ou senha inválidos.

Empty email

    LoginPage.Login With              ${EMPTY}                          abc123
    LoginPage.Alert Text Should Be    Oops. Informe um email válido!


Empty Password
    LoginPage.Login With              rogers@shield.com                   ${EMPTY}
    LoginPage.Alert Text Should Be    Oops. Informe sua senha secreta!

Incorret Email

    LoginPage.Login With              rogers&shield.com                 abc987
    LoginPage.Alert Text Should Be    Oops. Informe um email válido!


