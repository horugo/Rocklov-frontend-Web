*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
Add new equipo

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Login With                  eddie@vanhalen.com    pwd123
    Go To Equipo Form           
    Submit Equipo Form          ${equipo}
    Equipo Should Be Visible    ${equipo}[name]

Duplicated Equipo
    [Tags]      dup_equipo

    #dado que o equipamento fender foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    ${token}               Get Token Service    eddie@vanhalen.com    pwd123
    POST Equipo Service    ${equipo}            ${token}

