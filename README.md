# Framework Cucumber Ruby

Projeto de demonstração do framework de Cucumber com Ruby.

#Instalações Necessárias

- [VSCode](https://code.visualstudio.com/)
- [CMDER](http://cmder.net/)

Após clonar o projeto, acessar o prompt do CMDER e executar os seguintes comandos de instalação das GEMS:

- ```gem install bundler```. (gerenciador de gems de um projeto em ruby)
- ```bundle install``` .(responsável por instalar todas as gems necessárias para o projeto)

Verificar se as gems a seguir foram realmente intaladas corretamente. Utilizar o comando ```gem list```:

- [gem cucumber].
- [gem ruby].
- [gem rubyXL]. (caso a massa de dados do projeto necessite acessar uma planilha de Excel)
- [gem mysql2]. (caso a massa de dados do projeto necessite acessar um banco de dados)
- [gem selenium-webdriver].
- [gem json]. (caso a massa de dados do projeto necessite acessar um arquivo .json)

#Preparar IDE VSCode

Instalar as extensões necessárias (CTRL + Shift + X)

- [Ruby].
- [Cucumber (Gherkin) Full Support].
- [Gherkin Indent].
- [Portuguese (Brazil) Language Pack for Visual Studio Code].
- [Ruby Solargraph].
- [vscode-icons].

#Executar os Testes - pelo CMDER

Acessar a pasta do projeto (cd caminho_projeto)

Comando para executar todos os testes/features e gerar o report da execução na pasta reports:

**cucumber --format html --out=reports/features_report.html**

Comando para executar testes/features específicas e gerar o report da execução na pasta reports:

**cucumber features\(nome_da_feature_que_deseja_axecutar).feature --format html --out=reports/features_report.html**

Comando para executar testes/features específicas + tags específicas e gerar o report da execução na pasta reports: 

**cucumber features\(nome_da_feature_que_deseja_axecutar).feature --tags @(nome_da_tag_que_deseja_executar) --format html --out=reports/features_report.html**

O arquivo de report é criado dentro da pasta reports que se encontra na pasta do projeto.

#Massa de dados

Planilha do Excel: Se os dados que compõem os teste vêm de uma planilha do Excel, como boas praticas essa planilha deve estar na pasta do projeto. O caminho para acesso da planilha esta no código.

Banco de Dados: Se os dados que compõem os teste vêm de um Banco de Dados, as informações de conexão (host, username, password, database) estão no código.

Arquivo Json: Se os dados que compõem os teste vêm de um arquivo Json, como boas praticas esse arquivo deve estar na pasta do projeto.
