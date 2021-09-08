*Settings*
Documentation    Arquivo principal do projeto de automação

Library    Browser

Resource    actions/LoginActions.robot

Resource    pages/LoginPage.robot
Resource    pages/DashPage.robot

*Keywords*
Start Session
    New Browser    firefox         False    #slowMo=00:00:01
    New Page       https://rocklov-victor-web.herokuapp.com/

Finish Session
    Take Screenshot

