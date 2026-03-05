*** Settings ***
Documentation   This is some basic info about the whole suite
Library         SeleniumLibrary

# robot -d results Tests/Amazon.robot

*** Variables ***
${BROWSER}    chrome

*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    #Initialize Selenium
    Set Selenium Speed      .2s
    Set Selenium Timeout    5s

    # Open Browser parametrizable
    Open Browser    https://www.amazon.com    ${BROWSER}    options=add_argument("--headless")

    # resize browser window for recording
    Set Window Position     x=341  y=169
    Set Window Size         width=1024  height=700
    Maximize Browser Window

    Input Text              id=twotabsearchtextbox    Ferrari 458
    Click Button            id=nav-search-submit-button
    Wait Until Page Contains    Resultados
    Click Image             class=s-image
    Wait Until Page Contains    Rastar Coche RC
    Click Element           id=add-to-cart-button
    Wait Until Page Contains    Agregado al carrito

    Close Browser

*** Keywords ***
