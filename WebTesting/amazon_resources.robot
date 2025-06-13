*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_MAISVEND}    (//a[normalize-space()='Mais Vendidos'])[1]
${Titulo_MAISVEND}    //h1[@id='zg_banner_text']


*** Keywords ***
#Caso de teste 01
Abrir o navegador
    Open Browser   browser=chrome    #options=add_experimental_option("detach", True)
    Maximize Browser Window

# Fechar o navegador
#     Close Browser


Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MAISVEND}

Entrar no menu Mais Vendidos
    Click Element    locator=${MENU_MAISVEND}

Verificar se aparece a frase "${Frase}"
    Wait Until Page Contains    text=${Frase}
    Wait Until Element Is Visible  locator=${Titulo_MAISVEND}

Verificar se o titulo da pagina fica "${Titulo}"
    Title Should Be    title=${Titulo}

Verificar se aparece a categoria "${Titulo}"
    Element Should Be Visible    Locator=${Titulo}

#Caso de teste 02
Digitar o nome do produto "${Prod}" no campo de Pesquisa
    