*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        Login_keyword.robot


*** Test Cases ***
#Termék oldal megnyitása - név alapján
#Termék oldal megnyitása - kép alapján
#Termék információk ellenőrzése - név  (ugyaz-e?)
#Termék információk ellenőrzése - ár (ugyaz-e?)
#Termék információk ellenőrzése - leírás        (egyáltalán megjelenik-e?)
#Termék információk ellenőrzése - kép    (egyáltalán megjelenik-e?)
#Vissza navigáció - Back to products gomb

Nev alapján megnyitás
    Login with valid user
    Click Element    class:inventory_item_name
    Page Should Contain Element    class:inventory_details_name
    ${product_name}=    Get Text    class:inventory_details_name
    Page Should Contain     ${product_name}
    Sleep  2s

Kep alapján megnyitás
    Login with valid user
    Click Element    class:inventory_item_img
    Page Should Contain Element    class:inventory_details_name
    ${product_name}=    Get Text    class:inventory_details_name
    Page Should Contain     ${product_name}
    Sleep  2s

Ár alapján megnyitás
    Login with valid user
    Click Element    class:inventory_item_img
    Page Should Contain Element    class:inventory_details_price
    ${product_price}=    Get Text    class:inventory_details_price
    Page Should Contain     ${product_price}
    Sleep  2s

Leírás alapján megnyitás
    Login with valid user
    Click Element    class:inventory_item_img
    Page Should Contain Element    class:inventory_details_desc
    ${product_description}=    Get Text    class:inventory_details_desc
    Page Should Contain     ${product_description}
    Sleep  2s

Vissza navigáció
    Login with valid user
    Click Element    class:inventory_item_img
    Sleep  2s
    Click Button    id:back-to-products
    Page Should Contain Element   class:title
    Sleep  2s