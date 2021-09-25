*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    eddie@vanhalen.com    pwd123
Test Teardown    Finish Test

*Test Cases*
Add new equipo

    ${equipo}        Get Equipo         violao
    Remove Equipo    ${equipo}[name]

    Go To Equipo Form           
    Fill Equipo Form            ${equipo}          
    Submit Equipo Form          
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
    Go To Equipo Form     
    Fill Equipo Form      ${equipo}    
    Submit Equipo Form    

    #Então devo ver a mensagem de alerta "Anúncio já existe :/"
    Alert Text Should Be    Anúncio já existe :/    

    [Teardown]    Take Screenshot And Go Back

Required Fields
    [Tags]    required

    Go To Equipo Form
    Submit Equipo Form

    Alert Form Should Be    Adicione uma foto no seu anúncio.
    Alert Form Should Be    Informe a descrição do anúncio.
    Alert Form Should Be    Selecione uma categoria.
    Alert Form Should Be    Informe o valor da diária.