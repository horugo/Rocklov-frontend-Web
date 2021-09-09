* Settings *
Documentation       Aqui vamos consumir a API da Rocklov com um beneficio

Library     RequestsLibrary
Library     OperatingSystem

*Variables*
${base_url}     https://rocklov-victor-api.herokuapp.com

*Keywords*
Get Token Service
    [Arguments]     ${email}      ${password}

    ${payload}      Create Dictionary       email=${email}    password=${password}

    ${response}     POST
                    ...         ${base_url}/sessions
                    ...         json=${payload}

    [return]        ${response.json()}[user_token]

POST Equipo Service
    [Arguments]     ${equipo}       ${token}

    &{headers}    Create Dictionary    user_token=${token}

    ${bin_image}    Get Binary File      ${EXECDIR}/resources/fixtures/thumbnails/${equipo}[thumbnail]
    &{thumbnail}    Create Dictionary    thumbnail=${bin_image}

    ${response}    POST
    ...            ${base_url}/equipos        
    ...            data=${equipo}
    ...            headers=${headers}
    ...            files=${thumbnail}
    ...            expected_status=any

    [return]    ${response}
