*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Open Saucedemo firefox
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Sleep   2s
    Click Button    id:login-button
    Sleep   2s
    Page Should Contain Element    id:inventory_container
    Close Browser

Open Saucedemo firefox Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:user-name    standard_user
    Input Text    id:password     wrong_password
    Sleep   2s
    Click Button    id:login-button
    Should Contain    id:login_button_container    epic sadface: Username and password do not match any user in this service
    Sleep   2s
    Close Browser

Open Saucedemo firefox Login with wrong username and valid password
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:user-name    invalid_user
    Input Text    id:password     secret_sauce
    Sleep   2s
    Click Button    id:login-button
    Page Should Contain    id:login_button_container    epic sadface: Username and password do not match any user in this service
    Sleep   2s
    Close Browser

Open Saucedemo firefox Login without username
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:password     secret_sauce
    Sleep   2s
    Click Button    id:login-button
    Should Contain    id:login_button_container    epic sadface: Username is required
    Sleep   2s
    Close Browser

Open Saucedemo firefox Login without password
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:user-name    standard_user
    Should Contain    id:login_button_container    epic sadface: Password is required
    Sleep   2s
    Click Button    id:login-button
    Sleep   2s
    Close Browser