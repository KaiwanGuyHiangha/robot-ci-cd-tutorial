*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       https://the-internet.herokuapp.com/login
${USERNAME}  tomsmith
${PASSWORD}  SuperSecretPassword!

*** Test Cases ***
Login Success
    Setup Browser
    Go To    ${URL}
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  css=button[type="submit"]
    Page Should Contain    You logged into a secure area!
    Close Browser

*** Keywords ***
Setup Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage

    ${driver_path}=    Evaluate    __import__('webdriver_manager.chrome').chrome.ChromeDriverManager().install()
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(${driver_path})    selenium.webdriver

    Create Webdriver    Chrome    service=${service}    options=${options}
