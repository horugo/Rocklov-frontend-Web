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
    [Tags]    dup_equipo

    ${email}    Set Variable    eddie@vanhalen.com
    ${pass}     Set Variable    pwd123

    #dado que o equipamento fender foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    ${token}               Get Token Service    ${email}    ${pass}
    POST Equipo Service    ${equipo}            ${token}

    #Quando faço o cadastro desse equipo
    Login With            ${email}     ${pass}
    Go To Equipo Form     
    Submit Equipo Form    ${equipo}

    #Então devo ver a mensagem de alerta "Anúncio já existe :/"
    Alert Text Should Be        Anúncio já existe :/        