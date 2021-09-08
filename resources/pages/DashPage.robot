*Settings*
Documentation       Elementos da pagina meus anuncios (dashboard)

*Variables*
${DIV_CONTENT}      css=.dashboard

*Keywords*
User Should Be Logged In
    Wait For Elements State    ${DIV_CONTENT}    visible    5    Login error
