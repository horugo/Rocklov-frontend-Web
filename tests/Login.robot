*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
User Login

    New Browser    firefox      False
    New Page       https://rocklov-victor-web.herokuapp.com/

    # temporario
    Take Screenshot
