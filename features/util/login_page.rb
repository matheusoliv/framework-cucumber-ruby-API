require 'selenium-webdriver'

class LoginPage

    $helper = Helper.new
    
    #**********************Objetos*********************
    def lnk_SigIn
        nome_elemento = "Botão Sign In para acessar a pagina de login"
        return $helper.verifica_elemento(:xpath, "//*[@id='header']/div[2]/div/div/nav/div[1]/a", nome_elemento)
    end

    def btn_SigIn
        nome_elemento = "Botão Sign In para autenticar o login e senha"
        return $helper.verifica_elemento(:id, "SubmitLogin", nome_elemento)
    end

    def txt_EmailAddress
        nome_elemento = "Campo de texto para inserir o Email"
        return $helper.verifica_elemento(:id, "email", nome_elemento)
    end

    def txt_Password
        nome_elemento = "Campo de texto para inserir o Password"
        return $helper.verifica_elemento(:id, "passwd",nome_elemento)
    end

    def btn_OrderHistory
        nome_elemento = "Botão Order History"
        return $helper.verifica_elemento(:xpath, "//*[@id='center_column']/div/div[1]/ul/li[1]/a", nome_elemento)
    end

    def msg_LoginInvalid
        nome_elemento = "Mensagem de erro para Login inválido"
        return $helper.verifica_elemento(:css, "#center_column > div.alert.alert-danger123", nome_elemento)
    end
    #***************************************************
    
    #***************************************************
    # Function        : logar_site
    # Description     : Clicar no botão que acessa a pagina de login
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def logar_site
        $helper.clicar_objeto(lnk_SigIn())
    end

    #***************************************************
    # Function        : login_valido
    # Description     : Inserir um login e senha validos
    # Parameters      : email,password
    # Value Returned  : -
    #***************************************************
    def login_valido email, password
        $helper.preencher_web_edit(txt_EmailAddress(), email)
        $helper.preencher_web_edit(txt_Password(), password)
        $helper.clicar_objeto(btn_SigIn())
    end

    #***************************************************
    # Function        : resultado_login_valido
    # Description     : Verificar resultado para login válido
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def resultado_login_valido
        btn_OrderHistory()
    end

    #***************************************************
    # Function        : login_invalido
    # Description     : Inserir um login inválido a partir de uma planilha externa - Excel declarada abaixo
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def login_invalido email, password
        $helper.preencher_web_edit(txt_EmailAddress(), email)
        $helper.preencher_web_edit(txt_Password(), password)
        $helper.clicar_objeto(btn_SigIn())
    end

    #***************************************************
    # Function        : resultado_login_invalido
    # Description     : Verificar resultado para login inválido
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def resultado_login_invalido
        msg_LoginInvalid()
    end
end