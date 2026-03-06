*** Settings ***
Library           Selenium2Library
Library           Collections
Resource        Login_keyword.robot


*** Test Cases ***
#Üres mezők ellenőrzése - név
#Üres mezők ellenőrzése - cím
#Üres mezők ellenőrzése - minden mező üres
#Érvénytelen adatok kezelése - túl hosszú név        ${long_name}=    Evaluate    "A" * 100
#Érvénytelen adatok kezelése - speciális karakterek
#Érvénytelen adatok kezelése - csak számok a névben
#Checkout megszakítása - Cancel gombbal    (Ellenőrzni, hogy a Cancel gomb megnyomásakor visszatér-e a kosár oldalra)
#Érvényes adatokkal sikeres checkout folytatás


Ures mezők ellenőrzése név
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    ${first_name}=    Get Value    id:first-name
    ${last_name}=    Get Value    id:last-name
    Should Be Empty       ${first_name}  ${last_name}   
    Sleep  2s

ures cím alapján
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    ${postal_code}=    Get Value    id:postal-code
    Should Be Empty       ${postal_code}  
    Sleep  2s

tul hosszú név
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    ${long_name}=    Evaluate    "A" * 100
    Input Text    id:first-name     ${long_name}
    Input Text    id:last-name      ${long_name}
    Input Text    id:postal-code     12345
    Click Button   id:continue
    Page Should Contain Element     class:error-message-container
    Sleep  2s

speciális karakterek
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    Input Text    id:first-name     @#$%^&*()
    Input Text    id:last-name      @#$%^&*()
    Input Text    id:postal-code     12345
    Click Button   id:continue
    Page Should Contain Element     class:error-message-container 
    Sleep  2s

csak számok a névben
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    Input Text    id:first-name     123456
    Input Text    id:last-name      123456
    Input Text    id:postal-code     12345
    Click Button   id:continue
    Page Should Contain Element     class:error-message-container
    Sleep  2s

Vissza navigáció
    Login with valid user
    Click Element    class:inventory_item_name
    Sleep  1s
    Click Element    class:shopping_cart_link
    Click Element    id=checkout
    Click Element    id:cancel
    Page Should Contain Element   class:title
    Sleep  2s