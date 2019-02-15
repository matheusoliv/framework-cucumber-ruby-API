#language: pt
Funcionalidade: Conta

@regressivo @conta @positivo
Cenário: Criar nova conta
Dado que foi acessado o site
Quando inserir um email valido que não foi cadastrado
Então devo preencher todos os campos obrigatorios para cadastrar um novo usuario

@regressivo @conta @negativo
Cenário: Criar conta já cadastrada
Dado que foi acessado o site
Quando inserir um email valido porem já cadastrado anteriormente
Então devo analisar se apresentou um alerta de erro de usuario já cadastrado