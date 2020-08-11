***Settings***
Documentation  Suite dos testes de cadastro

Resource    ../resources/base.robot

Test Setup      Open Session
Test Teardown   Close Session

***Test Cases***
Cadastro Simples
    Dado que acesso a pagina inicial
    Quando submeto o email "dudutorres00@outlook.com"
    Devo ser autenticado

Email Incorreto
    Dado que acesso a pagina inicial
    Quando submeto o email "dudutorroutlook.com"
    Então devo ver a mensagem "Oops. Informe um email válido!"

Email não informado
    Dado que acesso a pagina inicial
    Quando submeto o email "${EMPTY}"
    Então devo ver a mensagem "Oops. Informe um email válido!"