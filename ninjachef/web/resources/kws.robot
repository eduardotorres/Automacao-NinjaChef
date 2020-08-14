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
Dado que "${email_cozinheiro}" é a minha conta de cozinheiro
    Set Test Variable       ${email_cozinheiro}

    &{headers}=       Create Dictionary        Content-Type=application/json
    &{payload}=       Create Dictionary        email=${email_cozinheiro}

    Create Session         api                http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=               Post Request       api            /sessions             data=${payload}          headers=${headers}
    Status Should Be       200                ${resp}

    ${token_cozinheiro}     Convert to String         ${resp.json()['_id']}
    Set Test Variable       ${token_cozinheiro}

E "${email_cliente}" é o email do cliente
    Set Test Variable       ${email_cliente}

    &{headers}=       Create Dictionary        Content-Type=application/json
    &{payload}=       Create Dictionary        email=${email_cliente}

    Create Session         api                http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=               Post Request       api            /sessions             data=${payload}          headers=${headers}
    Status Should Be       200                ${resp}

    ${token_cliente}     Convert to String         ${resp.json()['_id']}
    Set Test Variable       ${token_cliente}


E que "${produto}" está cadastrado no meu dashboard
    Set Test Variable       ${produto}

    &{payload}=         Create Dictionary       name=${produto}     plate=Kind      price=23.00

    ###buscando a imagem no formato binário
    ${image_file}=      Get Binary File        ${EXECDIR}/resources/images/hamburguerVeggie.jpg
    &{files}=           Create Dictionary       thumbnail=${image_file}
    
    ###obtendo o token na API
    &{headers}=         Create Dictionary       user_id=${token_cozinheiro}

    ###cria a sessão na API e manda um POST na rota /products enviando a foto e o payload como nome, preço e tipo
    Create Session         api                http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=               Post Request       api            /products           files=${files}       data=${payload}          headers=${headers}
    Status Should Be       200                ${resp}

    ${produto_id}          Convert to String         ${resp.json()['_id']}
    Set Test Variable      ${produto_id}

    Go To           ${base_url}
    Input Text      ${CAMPO_EMAIL}    ${email_cozinheiro}
    Click Element   ${BOTAO_ENTRAR}
    Wait Until Page Contains Element    ${DIV_DASH}



Quando o cliente solicita o preparo dos meus pratos
    
    &{headers}=       Create Dictionary        Content-Type=application/json        user_id=${token_cliente}
    &{payload}=       Create Dictionary        payment=Dinheiro

    Create Session         api                http://ninjachef-api-qaninja-io.umbler.net
    ${resp}=               Post Request       api            /products/${produto_id}/orders             data=${payload}          headers=${headers}
    Status Should Be       200                ${resp}


Então devo receber uma notificação de pedido

    ${mensagem_esperada}          Convert To String       ${email_cliente} está solicitando o preparo do seguinte prato: ${produto}
    Wait Until Page Contains      ${mensagem_esperada}    10


E posso aceitar ou rejeitar o pedido
    Wait Until Page Contains        ACEITAR         5
    Wait Until Page Contains        REJEITAR        5