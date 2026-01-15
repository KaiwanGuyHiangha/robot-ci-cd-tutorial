*** Settings ***
Library    SeleniumLibrary    timeout=10

*** Variables ***
${URL}       https://the-internet.herokuapp.com/login
${BROWSER}   Chrome
${USERNAME}  tomsmith
${PASSWORD}  SuperSecretPassword!

*** Test Cases ***
Login Success
    &{opts}=    Create Dictionary    args=--headless,--no-sandbox,--disable-dev-shm-usage
    Open Browser    ${URL}    ${BROWSER}    options=${opts}
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  css=button[type="submit"]
    Page Should Contain    You logged into a secure area!
    Close Browser
