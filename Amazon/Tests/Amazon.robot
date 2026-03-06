*** Settings ***
Documentation   This is some basic info about the whole suite
Library         SeleniumLibrary

# robot -d results Tests/Amazon.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke

     #Initialize Selenium
    Set selenium speed      .2s
    Set selenium timeout    5s

    #Open Browser            http://www.amazon.com       chrome
    #${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    #Call Method    ${options}    add_argument    "--headless=new"
    #Call Method    ${options}    add_argument    "--no-sandbox"
    #Call Method    ${options}    add_argument    "--disable-dev-shm-usage"
    #Call Method    ${options}    add_argument    "--window-size=1920,1080"

    #Open Browser    http://www.amazon.com    chrome    options=${options}
    Open Browser    http://www.amazon.com    chrome    options=add_argument(--headless);add_argument(--no-sandbox);add_argument(--disable-dev-shm-usage)

    # resize browser window for recording
    Set window position     x=341  y=169
    #Set window size         width=1935  height=1090
    Set window size         width=1024  height=700
    Maximize Browser Window



    input text              id=twotabsearchtextbox    Ferrari 458
    click button            id=nav-search-submit-button
    wait until page contains    Resultados
    click image             class=s-image
    wait until page contains    Rastar Coche RC
    click element           id=add-to-cart-button
    wait until page contains    Agregado al carrito

    Close Browser

*** Keywords ***
