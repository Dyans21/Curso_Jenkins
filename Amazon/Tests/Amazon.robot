*** Settings ***
Documentation   This is some basic info about the whole suite
Library         SeleniumLibrary

*** Variables ***
#${BROWSER}          chrome


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    # Initialize Selenium
    Set Selenium Speed      0.2s
    Set Selenium Timeout    5s

    # Open browser in Sauce Labs
    #Open Browser            http://www.amazon.com    ${BROWSER}
    Open Browser            http://www.amazon.com    
    # Resize browser window for recording
    Set Window Position     341  169
    Set Window Size         1024  700
    Maximize Browser Window

    # Buscar un producto y agregar al carrito
    Input Text              id=twotabsearchtextbox    Ferrari 458
    Click Button            id=nav-search-submit-button
    Wait Until Page Contains    Resultados
    Click Image             class=s-image
    Wait Until Page Contains    Rastar Coche RC
    Click Element           id=add-to-cart-button
    Wait Until Page Contains    Agregado al carrito

    Close Browser

*** Keywords ***
