***Settings***
Documentation           Login Tests on NinjaChef Mobile

Resource                ../resources/base.robot

Test Setup              Open Session
Test Teardown           Close Session

***Test Cases***
Accessing Menu
    Given that I desire eat "Massas"
    When I put my email "eduardo@gmail.com"
    Then I Should see the choose plates

