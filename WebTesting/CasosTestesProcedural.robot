*** Settings ***
Documentation    Essa switch testa o site da Amazon.com.busca_produtos
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navegador
#Suite Teardown serve para o fim da Suite
#Suite Setup serve para o inicio da Suite

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Mais Vendidos"
    [Documentation]  Esse teste verifica o menu Mais vendidos da Amazon
    ...              E com isso validando as informações presentes.
    [Tags]    menus
    Acessar a home page do site Amazon.com.br
#     Entrar no menu Mais Vendidos
#     Verificar se o titulo da pagina fica "Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon"
#     Verificar se aparece a frase "Mais vendidos"
#     Verificar se aparece a categoria "Apps e Jogos"

# Caso de Teste 02 -- Pesquisa de Produtos
#     [Documentation]  Esse teste verifica se existe um produto
#     ...              E com isso validando as informações presentes.
#     [Tags]    busca_produtos    video_games
#     Acessar a home page do site Amazon.com.br
#     Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
#     Clicar no botão de pesquisa
#     Verificar o resultado da pesquisa, listando o produto pesquisado
