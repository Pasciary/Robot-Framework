*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_MAISVEND}    ti60us-qbnrew-g49tzx-1x869w



*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome    options=add_experimental_option("detach", True)


# Fechar o navegador
#     Close Browser


Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MAISVEND}