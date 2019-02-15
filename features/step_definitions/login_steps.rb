#---------------------------------Login válido--------------------------------------

#Função onde os dados são reportados de uma planilha interna passando por parâmetro
Quando(/^inserir um login "([^"]*)" e senha "([^"]*)" validos$/) do |login, senha|
  loginPage = LoginPage.new
  loginPage.logar_site
  loginPage.login_valido(login, senha)
end

#Banco de dados
Quando("inserir um login e senha validos do banco") do
  loginPage = LoginPage.new
  helper = Helper.new
  loginPage.logar_site
  helper.ler_base_de_dados
  loginPage.login_valido($email_banco, $password_banco)
end

Então("devo acessar a home da pagina logada") do
  loginPage = LoginPage.new
  loginPage.resultado_login_valido
end

#---------------------------------Login inválido--------------------------------------
#Excel
Quando("inserir um login e senha invalido do excel") do
  loginPage = LoginPage.new
  helper = Helper.new
  loginPage.logar_site
  helper.ler_planilha_excel
  loginPage.login_invalido($email_excel, $password_excel)
end

#Json
E("inserir um login e senha invalido do json") do
  loginPage = LoginPage.new
  helper = Helper.new
  loginPage.logar_site
  helper.ler_arquivo_json
  loginPage.login_invalido($email_json,$password_json)
end

Então("devo analisar se apresentou um alerta de erro de login inválido") do
  loginPage = LoginPage.new
  loginPage.resultado_login_invalido
end