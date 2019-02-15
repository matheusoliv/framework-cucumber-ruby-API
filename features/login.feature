#language: pt
Funcionalidade: Login

#Teste usando os dados de uma planilha interna
@regressivo @login @positivo @local
Esquema do Cenário: Login válido
    Dado que foi acessado o site
    Quando inserir um login "<login>" e senha "<senha>" validos
    Então devo acessar a home da pagina logada
    Exemplos:
        | login                     | senha    |
        | matheusroque737@gmail.com | 12345678 |

#Teste usando os dados de uma planilha externa - Excel
@regressivo @login @negativo @excel
Cenário: Login inválido - Excel
    Dado que foi acessado o site
    Quando inserir um login e senha invalido do excel
    Então devo analisar se apresentou um alerta de erro de login inválido

#Teste usando os dados de um banco de dados - Banco
@regressivo @login @positivo @banco
Cenário: Login válido - Banco de Dados
    Dado que foi acessado o site
    Quando inserir um login e senha validos do banco
    Então devo acessar a home da pagina logada

#Teste usando os dados de um arquivo json
@regressivo @login @negativo @json
Cenário: Login válido - Json
    Dado que foi acessado o site
    Quando inserir um login e senha invalido do json
    Então devo analisar se apresentou um alerta de erro de login inválido