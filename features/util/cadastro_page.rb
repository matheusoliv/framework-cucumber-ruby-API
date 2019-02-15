class CadastroPage

    $helper = Helper.new

    #**********************Objetos*********************
    def txt_Email
        nome_elemento = "Campo de preenchimento do Email"
        return $helper.verifica_elemento(:id, "email_create", nome_elemento)
    end

    def btn_SubmitCreate
        nome_elemento = "Botão para criar uma nova conta"
        return $helper.verifica_elemento(:id, "SubmitCreate", nome_elemento)
    end

    def rb_Saudacao
        nome_elemento = "Botão de seleçao da Saudação"
        return $helper.verifica_elemento(:id, "id_gender1", nome_elemento)
    end

    def txt_FirstName
        nome_elemento = "Campo de preenchimento FirstName"
        return $helper.verifica_elemento(:id, "customer_firstname", nome_elemento)
    end

    def txt_LastName
        nome_elemento = "Campo de preenchimento LastName"
        return $helper.verifica_elemento(:id, "customer_lastname", nome_elemento)
    end

    def txt_Password
        nome_elemento = "Campo de preenchimento Password"
        return $helper.verifica_elemento(:id, "passwd", nome_elemento)
    end

    def rb_Day
        nome_elemento = "Campo de seleção Data"
        return $helper.verifica_elemento(:id, "days", nome_elemento)
    end

    def rb_Months
        nome_elemento = "Campo de seleção Mês"
        return $helper.verifica_elemento(:id, "months", nome_elemento)
    end

    def rb_Years
        nome_elemento = "Campo de seleção Ano"
        return $helper.verifica_elemento(:id, "years", nome_elemento)
    end

    def chk_NewLetter
        nome_elemento = "Check de seleção Newletter"
        return $helper.verifica_elemento(:id, "newsletter", nome_elemento)
    end

    def chk_Offers
        nome_elemento = "Check de seleção Offers"
        return $helper.verifica_elemento(:id, "optin", nome_elemento)
    end

    def txt_Company
        nome_elemento = "Campo de preenchimento Company"
        return $helper.verifica_elemento(:id, "company", nome_elemento)
    end

    def txt_Address
        nome_elemento = "Campo de preenchimento Address"
        return $helper.verifica_elemento(:id, "address1", nome_elemento)
    end

    def txt_City
        nome_elemento = "Campo de preenchimento City"
        return $helper.verifica_elemento(:id, "city", nome_elemento)
    end

    def cb_State
        nome_elemento = "Combo State"
        return $helper.verifica_elemento(:id, "id_state", nome_elemento)
    end

    def txt_PostalCode
        nome_elemento = "Campo de preenchimento Postal Code"
        return $helper.verifica_elemento(:id, "postcode", nome_elemento)
    end

    def txt_AdditionalInformation
        nome_elemento = "Campo de preenchimento Additional Information"
        return $helper.verifica_elemento(:id, "other", nome_elemento)
    end

    def txt_HomePhone
        nome_elemento = "Campo de preenchimento Home Phone"
        return $helper.verifica_elemento(:id, "phone", nome_elemento)
    end

    def txt_MobilePhone
        nome_elemento = "Campo de preenchimento Mobile Phone"
        return $helper.verifica_elemento(:id, "phone_mobile", nome_elemento)
    end

    def txt_Alias
        nome_elemento = "Campo de preenchimento Alias"
        return $helper.verifica_elemento(:id, "alias", nome_elemento)
    end

    def msg_EmailInvalido
        nome_elemento = "Mensagem de Email inválido"
        return $helper.verifica_elemento(:id, "create_account_error", nome_elemento)
    end
    #***************************************************

    #***************************************************
    # Function        : cadastrar_usuario
    # Description     : Cadastrar um novo usuário inserindo dados validos
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def cadastrar_usuario
        $helper.preencher_web_edit(txt_Email(), CADASTRO[:cadastrar_login_valido][:email])
        $helper.clicar_objeto(btn_SubmitCreate())
        rb_Saudacao()
        $helper.clicar_objeto(rb_Saudacao())
        $helper.preencher_web_edit(txt_FirstName(), CADASTRO[:cadastrar_login_valido][:nome])
        $helper.preencher_web_edit(txt_LastName(), CADASTRO[:cadastrar_login_valido][:sobrenome])
        $helper.preencher_web_edit(txt_Password(), CADASTRO[:cadastrar_login_valido][:senha])
        $helper.clicar_objeto(rb_Day())
        $helper.seleciona_combobox(rb_Day(), CADASTRO[:cadastrar_login_valido][:dia])
        $helper.clicar_objeto(rb_Months())
        $helper.seleciona_combobox(rb_Months(), CADASTRO[:cadastrar_login_valido][:mes])
        $helper.clicar_objeto(rb_Years())
        $helper.seleciona_combobox(rb_Years(), CADASTRO[:cadastrar_login_valido][:ano])

        if CADASTRO[:cadastrar_login_valido][:newsletter] = 'Sim'
            $helper.clicar_objeto(chk_NewLetter())
        end

        if CADASTRO[:cadastrar_login_valido][:offers] = 'Sim'
            $helper.clicar_objeto(chk_Offers())
        end
    
        $helper.preencher_web_edit(txt_Company(), CADASTRO[:cadastrar_login_valido][:empresa])
        $helper.preencher_web_edit(txt_Address(), CADASTRO[:cadastrar_login_valido][:endereco_principal])
        $helper.preencher_web_edit(txt_City(), CADASTRO[:cadastrar_login_valido][:cidade])
        $helper.seleciona_combobox(cb_State(), CADASTRO[:cadastrar_login_valido][:estado])
        $helper.preencher_web_edit(txt_PostalCode(), CADASTRO[:cadastrar_login_valido][:cep])
        $helper.preencher_web_edit(txt_AdditionalInformation(), CADASTRO[:cadastrar_login_valido][:informacao_adicional])
        $helper.preencher_web_edit(txt_HomePhone(), CADASTRO[:cadastrar_login_valido][:telefone_fixo])
        $helper.preencher_web_edit(txt_MobilePhone(), CADASTRO[:cadastrar_login_valido][:telefone_celular])
        $helper.preencher_web_edit(txt_Alias(), CADASTRO[:cadastrar_login_valido][:referencia])
    end

    #***************************************************
    # Function        : cadastrar_usuario_invalido
    # Description     : Cadastrar um novo usuário inserindo dados invalidos
    # Parameters      : -
    # Value Returned  : -
    #***************************************************
    def cadastrar_usuario_invalido
        $helper.preencher_web_edit(txt_Email(), CADASTRO[:cadastrar_login_invalido][:email])
        $helper.clicar_objeto(btn_SubmitCreate())
    end

    #***************************************************
    # Function        : resultado_cadastrar_usuario_invalido
    # Description     : Resultado ao tentar cadastrar um novo usuário inserindo dados invalidos
    # Parameters      : -
    # Value Returned  : -
     #***************************************************
    def resultado_cadastrar_usuario_invalido
        msg_EmailInvalido()
    end
end