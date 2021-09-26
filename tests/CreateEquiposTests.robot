*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    ${EMAIL}    ${PASS}
Test Teardown    Finish Test

*Variables*
${EMAIL}    eddie@vanhalen.com
${PASS}     pwd123

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

    #dado que o equipamento fender foi cadastrado na minha conta
    ${equipo}              Get Equipo           fender
    ${token}               Get Token Service    ${EMAIL}    ${PASS}
    POST Equipo Service    ${equipo}            ${token}

    #Quando faço o cadastro desse equipo
    Go To Equipo Form     
    Fill Equipo Form      ${equipo}    
    Submit Equipo Form    

    #Então devo ver a mensagem de alerta "Anúncio já existe :/"
    Alert Text Should Be    Anúncio já existe :/    

    [Teardown]    Take Screenshot And Go Back

Required Fields

    @{expected_alerts}    Create List                          
    ...                   Adicione uma foto no seu anúncio.
    ...                   Informe a descrição do anúncio.
    ...                   Selecione uma categoria.
    ...                   Informe o valor da diária.

    @{got_alerts}    Create List

    Go To Equipo Form
    Submit Equipo Form

    FOR               ${position}                     IN RANGE       1    5
    ${text}           Get Text For Required Alerts    ${position}
    Append To List    ${got_alerts}                   ${text}
    END

    Log    ${got_alerts}

    Lists Should Be Equal    ${got_alerts}    ${expected_alerts}