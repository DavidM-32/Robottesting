#shopping cart functionality
#    Add multiple products from the shopping cart
#    Remove products from the shopping cart
#    Check the contents of the shopping cart

*** settings ***
Library    Selenium2Library

*** Test Cases ***
Open Saucedemo firefox and add products to cart
    Open Browser    https://www.saucedemo.com    firefox
    Input Text    id:user-name    standard_user
    Input Text    id:password     secret_sauce
    Sleep   2s
    Click Button    id:login-button
    Sleep   2s
    Page Should Contain Element    id:inventory_container
    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Button    id:add-to-cart-sauce-labs-bike-light
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    Click Button    id:add-to-cart-sauce-labs-fleece-jacket
    Click Button    id:add-to-cart-sauce-labs-onesie
    Close Browser
