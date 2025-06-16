*** Settings ***
Documentation    Essa switch testa o site da Amazon.com.busca_produtos
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Run Keywords    
...    Capture Page Screenshot    AND    
...    Close Browser

#Suite Teardown serve para o fim da Suite
#Suite Setup serve para o inicio da Suite

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu Mais Vendidos
    [Documentation]  Esse teste verifica o menu Mais vendidos da Amazon
    ...              E com isso validando as informações presentes.
    [Tags]    menus    categorias
    Given que estou na home page da amazon.com.br
    When entrar no menu Mais Vendidos
    Then deve aparecer a opção de "Apps e Jogos"
    Then clicar na categoria "Apps e Jogos"

# Caso de Teste 02 - Pesquisa de Produtos
#     [Documentation]  Esse teste verifica se existe um produto
#     ...              E com isso validando as informações presentes.
#     [Tags]    busca_produtos    video_games
#     Dado que estou na home page da amazon.com.br
#     Quando pesquisar pelo produto "Xbox Series S"
#     Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
#     E um produto da linha "Xbox Series S" deve ser mostrado na página