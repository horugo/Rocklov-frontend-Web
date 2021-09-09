*Settings*
Documentation    Equipo Actions

*Keywords*
Go To Equipo Form
    Click                      text=Criar anúncio
    #  checkpoint
    Wait For Elements State    id=equipoForm         visible    5

Fill Equipo Form
    [Arguments]     ${equipo}

    ${thumb}    Set Variable    ${EXECDIR}/resources/fixtures/thumbnails/${equipo}[thumbnail]

    ${promise}=    Promise To Upload File    ${thumb}
    Click          id=thumbnail              
    Wait For       ${promise}

    Fill Text            id=name        ${equipo}[name]
    Select Options By    id=category    value               ${equipo}[category]
    Fill Text            id=price       ${equipo}[price]

Submit Equipo Form
    Click               text=Cadastrar

Equipo Should Be Visible
    [Arguments]     ${equipo_name}

    Wait For Elements State
    ...     css=tr >> text=${equipo_name}
    ...     visible
    ...     5

Alert Form Should Be
    [Arguments]         ${expect_message}

    Wait For Elements State
    ...         css=.alert-form >> text=${expect_message}
    ...         visible
    ...         5