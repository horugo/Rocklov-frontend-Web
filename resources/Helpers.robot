* Settings *
Documentation    Aqui teremos as KWs de ajuda

Library    OperatingSystem 

*Keywords*
Get Equipo
    [Arguments]    ${equipo}

    ${fixture}    Get File    ${EXECDIR}/resources/fixtures/equipos.json
    ${json}       Evaluate    json.loads($fixture)                          json

    ${select_equipo}    Set Variable    ${json}[${equipo}]

    [return]    ${select_equipo}

Get Token From LS

    ${token}    LocalStorage Get Item    user_token

    [return]    ${token}