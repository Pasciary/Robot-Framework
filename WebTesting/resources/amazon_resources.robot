*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br
${MENU_MAISVEND}    (//a[normalize-space()='Mais Vendidos'])[1]
${Titulo_MAISVEND}    //h1[@id='zg_banner_text']
${AppsEJogos}    xpath=//a[@href="/gp/bestsellers/mobile-apps/ref=zg_bs_nav_mobile_apps_0"]
${XBOXS}    //h2[@aria-label="Anúncio patrocinado – Console Xbox Series S + Microsoft 8li-00001 Headset Com Fio Xbox"]//span[contains(text(),"Console Xbox Series S + Microsoft 8li-00001 Headse")]
${test}    aria-label="Console Xbox Series S"

*** Keywords ***
# Keywords Defaults
Captura log
    Capture Page Screenshot

Abrir o navegador
    Open Browser   browser=chrome    #options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Close Browser

#Caso de teste 01 - Vai na guia mais vendidos e procura Apps e Jogos
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

Verificar se aparece a categoria "Apps e Jogos"
    Element Should Be Visible    locator=zg_banner_text

Clicar na categoria "Apps e Jogos"
    Click Link      Apps e Jogos    # Para clicar em um link href


#Caso de teste 02 - Pesquisa produto Xbox series S
Digitar o nome do produto "${Prod}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${Prod}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-text

Verificar o resultado da pesquisa, listando "${Prod}" na pesquisa
    Element Should Be Visible    locator=//span[normalize-space()='${Prod}']



# Gherkin Steps
Given que estou na home page da amazon.com.br
    Acessar a home page do site Amazon.com.br

When entrar no menu Mais Vendidos
    Entrar no menu Mais Vendidos
    Verificar se aparece a frase "Mais vendidos"
    Verificar se o titulo da pagina fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"

Then deve aparecer a opção de "Apps e Jogos"
    Verificar se aparece a categoria "Apps e Jogos"

Then clicar na categoria "Apps e Jogos"
    Clicar na categoria "Apps e Jogos"
