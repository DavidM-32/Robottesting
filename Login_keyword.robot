*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login with valid user
    Open Browser    https://www.saucedemo.com    chrome
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Sleep   2s
    Click Button    id:login-button