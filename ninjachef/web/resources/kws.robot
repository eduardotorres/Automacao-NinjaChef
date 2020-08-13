***Settings***
Documentation   Palavras Chaves

***Keywords***
Dado que acesso a pagina inicial
   Go To     ${base_url}

Quando submeto o email "${email}"
    Input Text      ${CAMPO_EMAIL}    ${email}
    Click Element   ${BOTAO_ENTRAR}

Devo ser autenticado
    Wait Until Page Contains Element    ${DIV_DASH}  

Então devo ver a mensagem "${expect_message}"
    Wait Until Element Contains     ${DIV_ALERT}     ${expect_message}


###################Cadastro de pratos#######################

Dado que "${produto}" é um prato
    Set Test Variable     ${produto}      

Quando faço o cadastro do item
    Wait Until Element Is Visible     ${BOTAO_ADD}        5
    Click Element                     ${BOTAO_ADD} 

    Choose File      ${ANEXO_FOTO}           ${EXECDIR}/resources/images/${produto['img']}
    Input Text       ${CAMPO_NOME}                   ${produto['nome']}
    Input Text       ${CAMPO_TIPO}                  ${produto['tipo']}
    Input Text       ${CAMPO_PRECO}                   ${produto['preco']}
    Click Element    ${BOTAO_CADASTRAR}     

Devo ver o item no dashboard
    Wait Until Element Contains     ${LISTA_PRODUTOS}       ${produto['nome']}


############ Receber Pedidos ###################
