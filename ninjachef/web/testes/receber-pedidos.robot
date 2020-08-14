***Settings***
Documentation       Receber Pedidos
...                 Sendo um cozinheiro que possui produtos no dashboard
...                 Quero receber solicitação de preparo dos pratos
...                 Para que eu possa enviá-los aos clientes

Resource    ../resources/base.robot

Test Setup      Open Session
Test Teardown   Close Session

***Test Cases***
Receber Novo Pedido
    Dado que "cozinheiro@gmail.com" é a minha conta de cozinheiro
    E "cliente@gmail.com" é o email do cliente 
    E que "Hamburguer Vegano" está cadastrado no meu dashboard
    Quando o cliente solicita o preparo dos meus pratos
    Então devo receber uma notificação de pedido
    E posso aceitar ou rejeitar o pedido