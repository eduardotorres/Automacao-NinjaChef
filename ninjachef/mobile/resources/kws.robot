***Settings***
Documentation        Keywords of implementation


***Keywords***
Given that I desire eat "${prato}"
    Set Test Variable    ${prato}  

When I put my email "${email}"
    Wait Until Page Contains          Buscar Prato            30
    Input Text      accessibility_id=emailInput           ${email}
    Input Text      accessibility_id=plateInput           ${prato}
    Click Text      Buscar Prato

Then I Should see the choose plates
    Wait Until Page Contains        Fome de ${prato}       