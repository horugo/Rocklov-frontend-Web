*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
User Login

    New Browser    firefox                                      False
    New Page       https://rocklov-victor-web.herokuapp.com/

    Fill Text    id=user_email                      rogers@shield.com
    Fill Text    css=input[placeholder*="senha"]    pwd123
    Click        text=Entrar

    Wait For Elements State    css=.dashboard    visible    5    Login error

    Take Screenshot
