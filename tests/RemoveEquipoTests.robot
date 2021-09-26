*Settings*
Documentation    Remove Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Login Session    ${EMAIL}    ${PASS}
Test Teardown    Finish Test

*Variables*
${EMAIL}    jimmi.hendrix@hotmail.com
${PASS}     pwd123

*Test Cases*
Remove Equipo
    [Tags]      rm_equipo

    #Dado que saxofone é um equipamento indesejado
    ${equipo}              Get Equipo           saxofone
    ${token}               Get Token From LS
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}            ${token}
    Reload

    # Quando solicito a remoção desse equipo
    Request Removal    ${equipo}[name]

    # E confirmo a exclusão
    Confirm Removal

    # Então esse equipo não deve ser exibido na lista
    Equipo Not Should Be Visible    ${equipo}[name]

Removal Give UP
    [Tags]      rm_equipo

    #Dado que conga é um equipamento indesejado
    ${equipo}              Get Equipo           conga
    ${token}               Get Token From LS
    Remove Equipo          ${equipo}[name]
    POST Equipo Service    ${equipo}            ${token}
    Reload

    # Quando solicito a remoção desse equipo
    Request Removal    ${equipo}[name]

    # Mas eu desisto da ação remoção
    Cancel Removal

    # Então o equipamento deve permanecer na lista
    Equipo Should Be Visible    ${equipo}[name]