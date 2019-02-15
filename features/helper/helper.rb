require 'selenium-webdriver'
require 'json'

class Helper

    include Mysql2

    #***************************************************
    # Function        : configurar_ambiente
    # Description     : Função responsável por acessar uma determinada url
    # Parameters      : url
    # Value Returned  : -
    #***************************************************
    def configurar_ambiente url
        $driver.get url
    end

    #***************************************************
    # Function        : clicar_objeto
    # Description     : Função responsável por clicar em um objeto
    # Parameters      : identificador , objeto
    # Value Returned  : -
    #***************************************************
    def clicar_objeto objeto
        objeto.click
    end

    #***************************************************
    # Function        : preencher_web_edit
    # Description     : Função que preenche um elemento webEdit
    # Parameters      : identificador , objeto , valor
    # Value Returned  : -
    #***************************************************
    def preencher_web_edit objeto , valor
        objeto.send_keys valor      
    end

    #***************************************************
    # Function        : verifica_elemento
    # Description     : Função que aguarda elemento ficar visivel em tela por um tempo determinado, se o elemento for identificado, retorna o elemento. Usou-se tratamento de erro
    # Parameters      : identificador , objeto, descricao
    # Value Returned  : -
    #***************************************************
    def verifica_elemento identificador, objeto, descricao
        begin           
            wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
            element = wait.until { $driver.find_element(identificador => objeto) }
            return $driver.find_element(identificador, objeto)
        rescue => exception
            fail(ArgumentError.new("Objeto <" + descricao + "> não encontrado"))

        end
    end

    #***************************************************
    # Function        : seleciona_combobox
    # Description     : Função para selecionar um valor no combobox
    # Parameters      : identificador , objeto , valor
    # Value Returned  : -
    #***************************************************
    def seleciona_combobox objeto , valor
        combobox = Selenium::WebDriver::Support::Select.new(objeto)
        combobox.select_by(:value, valor)
    end

    #***************************************************
    # Function        : ler_base_de_dados
    # Description     : Função responsável por ler os dados de um banco de dados externo e armazenar em variaveis globais
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def ler_base_de_dados
        #Parâmetros para conexão
        @con = Mysql2::Client.new(host: "127.0.0.1", username: "root", password: "", database: "login")
        #Comando sql de busca dos dados
        @rs = @con.query("SELECT * from login")       
        #Atribuindo os dados retornado da consultas a variaveis globais
        @rs.each do | row |
            $email_banco = "#{row['login_email']}"
            $password_banco = "#{row['login_password']}"
        end
    end

    #***************************************************
    # Function        : ler_arquivo_json
    # Description     : Função responsável por ler os dados de um arquivo .json e armazenar em variaveis globais
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def ler_arquivo_json
        file = File.read('Massa.json')
        dados_jason = JSON.parse(file)
        $email_json = dados_jason['login_invalido'][0]['usuario']
        $password_json = dados_jason['login_invalido'][0]['senha']
    end
    
    #***************************************************
    # Function        : ler_planilha_excel
    # Description     : Função responsável por ler os dados de uma planilha do excel
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def ler_planilha_excel
        planilha = RubyXL::Parser.parse("C:/Workspace/AutomacaoRuby/Massa.xlsx")
        abaPlanilha=planilha['Login']
        $email_excel = abaPlanilha.sheet_data[1][0].value
        $password_excel = abaPlanilha.sheet_data[1][1].value  
    end
end