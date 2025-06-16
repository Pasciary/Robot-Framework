*** Settings ***
Documentation   Exemplo de escopo de variáveis: GLOBAIS, SUITE, TESTE (test case) e LOCAL (keyword)
Library         String

*** Variable *** 
# Instancia variaveis globais na suite.

${GLOBAL_INSTANCIADA}     Minha variável GLOBAL_INSTANCIADA foi instanciada para a suíte


# Toda variavel que o seu escopo é para Suite vai ser executado só nessa Suite
# Caso seja no Teste, ele vai ser só para o teste em questão, não sendo visivel para os outros testes
# Variavel só para Keyword vai ser visivel só para keyword.

*** Test Cases ***
Caso de teste de exemplo 01
    Uma keyword qualquer 01
    Uma keyword qualquer 02

Caso de teste de exemplo 02
    Uma keyword qualquer 02
    Uma keyword qualquer 03

Caso de teste de exemplo 03
    Uma keyword qualquer 04

*** Keywords ***
Uma keyword qualquer 01
    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}     Generate Random String
    # Criação de uma variavel que possui uma keyword de retorno, essa generate retorna uma string aleatoria

    Set Global Variable    ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO}
    # Essa variavel vai ser criada para todos os testes globalmente, apartir de sua execução.

        Set Suite Variable     ${SUITE_CRIADA_EM_TEMPO_EXECUCAO}    Variável da suíte
    # Esta variavel só vai ser utilizada nesse suite em questão depois de criada.

    Set Test Variable      ${TESTE_01}   Variável do teste 01
    Log         ${TESTE_01}
    #A variável "local" pode ser utilizada somente na keyword em execução, como esta no test1 vai aparecer apenas para ele

    ${LOCAL}    Set Variable    Variável local da keyword 01
    # Essa forma de chamar uma variavel serve apenas da mesma forma que a set test, porém é realizada de forma diferente.
    Log   ${LOCAL}

Uma keyword qualquer 02
    ${LOCAL}     Set Variable    Variável local da keyword 02
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
    # A keyword abaixo vai funcionar no Caso de Teste 01 e falhar no Case de Teste 02
    Log    ${TESTE_01}

Uma keyword qualquer 03
    ${LOCAL}     Set Variable    Variável local da keyword 03
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}

Uma keyword qualquer 04
    ${LOCAL}     Set Variable    Variável local da keyword 04
    Log    ${LOCAL}
    Log    ${GLOBAL_INSTANCIADA} / ${GLOBAL_CRIADA_EM_TEMPO_EXECUCAO} / ${SUITE_CRIADA_EM_TEMPO_EXECUCAO} / ${LOCAL}
