*Settings*
Documentation    Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
Add new equipo

    ${equipo}    Get Equipo    violao

    Login With           eddie@vanhalen.com    pwd123
    Go To Equipo Form    
    # Submit Equipo Form
    # Should Be Equipo Is Available