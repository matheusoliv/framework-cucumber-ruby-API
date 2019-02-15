#---------------------------------Cadastro válido----------------------------------------

Quando("inserir um email valido que não foi cadastrado") do
  loginPage = LoginPage.new
  loginPage.logar_site
end

Então("devo preencher todos os campos obrigatorios para cadastrar um novo usuario") do
  cadastroPage = CadastroPage.new
  cadastroPage.cadastrar_usuario
end

#---------------------------------Cadastro inválido--------------------------------------

Quando("inserir um email valido porem já cadastrado anteriormente") do
  loginPage = LoginPage.new
  cadastroPage = CadastroPage.new
  loginPage.logar_site
  cadastroPage.cadastrar_usuario_invalido
end

Então("devo analisar se apresentou um alerta de erro de usuario já cadastrado") do
  cadastroPage = CadastroPage.new
  cadastroPage.resultado_cadastrar_usuario_invalido
end