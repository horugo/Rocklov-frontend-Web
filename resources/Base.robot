*Settings*
Documentation    Arquivo principal do projeto de automação

Library    Browser
Library    libs/mongo.py

Resource    Helpers.robot
Resource    actions/LoginActions.robot
Resource    actions/EquipoActions.robot

*Keywords*
Start Session
    New Browser    firefox         False    #slowMo=00:00:01
    New Page       https://rocklov-victor-web.herokuapp.com/

Finish Test
    Take Screenshot
    
Take Screenshot And Logout
    Take Screenshot
    Do Logout
