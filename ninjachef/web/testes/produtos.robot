***Settings***
Documentation       Cadastro de Produtos (Pratos)

Resource    ../resources/base.robot

Test Setup      Login Session       dudutorres00@outlook.com
Test Teardown   Close Session

***Variables***
&{lasanha}=     img=lasanha.jpg    nome=lasanha       tipo= Massas   preco= 45.00
&{bolinhoMacaxeira}=        img=IMG_0891.jpg    nome=bolinho de macaxeira       tipo= Massas    preco= 17.00

***Test Cases***
Novo Prato
    Dado que "${lasanha}" é um prato
    Quando faço o cadastro do item
    Devo ver o item no dashboard
 
    Dado que "${bolinhoMacaxeira}" é um prato
    Quando faço o cadastro do item
    Devo ver o item no dashboard