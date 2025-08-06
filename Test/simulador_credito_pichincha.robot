*** Settings ***
Library    SeleniumLibrary
Library    Dialogs
# Importa la librería SeleniumLibrary para automatización web

*** Variables ***
${URL}    https://www.pichincha.com/detalle-producto/simulador-de-credito
${MONTO}    5000
${PLAZO}    12 meses (1.0 años)
# Variables para la URL del simulador, monto y plazo del crédito

*** Test Cases ***
Simular Credito Preciso En Banco Pichincha
    # Abre el navegador y navega al simulador de crédito
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    # Espera que cargue el selector de tipo de crédito
    Wait Until Element Is Visible    xpath=//select[@id='selcProduct']
    # Selecciona el tipo de crédito "Preciso"
    Select From List By Label    xpath=//select[@id='selcProduct']    Preciso
    # Espera el campo de monto y lo completa
    Wait Until Element Is Visible    xpath=//input[@id='inputdinero']
    Input Text    xpath=//input[@id='inputdinero']    ${MONTO}
    # Selecciona el plazo de 12 meses
    Wait Until Element Is Visible    xpath=//select[@id='selectplazo']
    Select From List By Label    xpath=//select[@id='selectplazo']    ${PLAZO}
    # Selecciona el método de pago de intereses "Método Francés"
    Click Element    xpath=//strong[contains(text(),'Método Francés')]
    # Hace clic en el botón Simular
    Click Button    xpath=//button[@id='BtnSimu']
    Pause Execution
    # Espera que aparezca el resultado de la simulación
    Wait Until Page Contains    Tus pagos mensuales serán
    Wait Until Element Is Visible    xpath=//*[@id="lbl03"]
    Wait Until Element Is Enabled    xpath=//*[@id="lbl03"]
    # Verifica que el resultado esperado esté presente
    Page Should Contain    $456,71

    # Cierra el navegador
    Close Browser
# Este caso automatiza la simulación de un crédito Preciso en Banco Pichincha y valida el resultado.
