*** Settings ***
Library    SeleniumLibrary    timeout=10

*** Variables ***
${URL}       https://the-internet.herokuapp.com/login
${BROWSER}   Edge
${USERNAME}  tomsmith
${PASSWORD}  SuperSecretPassword!

*** Test Cases ***
Login Success
    Open Browser    ${URL}    ${BROWSER}    headless=True
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  css=button[type="submit"]
    Page Should Contain    You logged into a secure area!
    Close Browser
