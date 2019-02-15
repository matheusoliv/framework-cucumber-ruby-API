#Funções que são acessadas por mais de um cenário
Dado("que foi acessado o site") do
  helper = Helper.new
  helper.configurar_ambiente "http://automationpractice.com/index.php"
end