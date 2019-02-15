Dado("que foi realizada a conexao") do
    @url = HTTParty.get('http://api.postmon.com.br/v1/cep/06454000')
end
  
Quando("receber os valores da API") do
    $bairro = @url['bairro']
    $cidade = @url['cidade']
end
  
Então("devo mostar seus espectivos valores") do
    puts "Bairro: #{$bairro}"
    puts "Cidade: #{$cidade}"
end