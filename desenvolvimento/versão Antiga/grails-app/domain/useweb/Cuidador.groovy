package useweb

class Cuidador extends Pessoa {
    static hasMany = [Usuario]
    
    //String cnsMae
    String vinculo
    //String tipo1
    //String codigoArea1
    //String telefone1
    //String observacao1
    //String tipo2
    //String codigoArea2
    //String telefone2
    //String observacao2
   
    
    /*
    void setNome(String nome) {
        this.nome = nome.toUpperCase()
    } 
    
    void setCpf(String cpf) {
        if (cpf != null) {
            this.cpf = cpf.toUpperCase()
        } else {
            this.cpf = cpf
        }
    }
    
    void setRg(String rg) {
        if (rg != null) {
            this.rg = rg.toUpperCase()
        } else {
            this.rg = rg
        }
    }
    
    void setOrgaoEmissor(String orgaoEmissor) {
        if (orgaoEmissor != null) {
            this.orgaoEmissor = orgaoEmissor.toUpperCase()
        } else {
            this.orgaoEmissor = orgaoEmissor
        }
    }
    
    void setCnsMae(String cnsMae) {
        if (cnsMae != null) {
            this.cnsMae = cnsMae.toUpperCase()
        } else {
            this.cnsMae = cnsMae
        }
    }
    */
    void setVinculo(String vinculo) {
        this.vinculo = vinculo.toUpperCase()
    }
    /*
    void setTipo1(String tipo1) {
        this.tipo1 = tipo1.toUpperCase()
    }
    
    void setCodigoArea1(String codigoArea1) {
        this.codigoArea1 = codigoArea1.toUpperCase()
    }
    
    void setTelefone1(String telefone1) {
        this.telefone1 = telefone1.toUpperCase()
    }
    
    void setObservacao1(String observacao1) {
        if (observacao1 != null) {
            this.observacao1 = observacao1.toUpperCase()
        } else {
            this.observacao1 = observacao1
        }   
    }
    
    void setTipo2(String tipo2) {
        if (tipo2 != null) {
            this.tipo2 = tipo2.toUpperCase()
        } else {
            this.tipo2 = tipo2
        }
    }
    
    void setCodigoArea2(String codigoArea2) {
        if (codigoArea2 != null) {
            this.codigoArea2 = codigoArea2.toUpperCase()
        } else {
            this.codigoArea2 = codigoArea2
        }
    }
    
    void setTelefone2(String telefone2) {
        if (telefone2 != null) {
            this.telefone2 = telefone2.toUpperCase()
        } else {
            this.telefone2 = telefone2
        }
    }
    
    void setObservacao2(String observacao2) {
        if (observacao2 != null) {
            this.observacao2 = observacao2.toUpperCase()
        } else {
            this.observacao2 = observacao2
        }
    }
   */
    
    static constraints = {
        //nome(blank: false, nullable: false)
        //cpf()
        //rg()
        //orgaoEmissor()
        //cnsMae()
        vinculo(inList: ["PAI","PÃE","IRMÃO(Ã)","ESPOSO(A)","FILHO(A)","AVOÔ(Ó)","NETO(A)","ENTEADO(A)","TIO(A)","CUNHADO(A)","SOBRINHO(A)","PRIMO(A)", "OUTRO"], blank: false, nullable: false)
        //tipo1(inList: ["RESIDENCIAL", "COMERCIAL", "CELULAR", "RECADO"], blank: false, nullable: false)
        //codigoArea1(blank: false, nullable: false)
        //telefone1(blank: false, nullable: false)
        //observacao1(nullable: true)
        //tipo2(inList: ["RESIDENCIAL", "COMERCIAL", "CELULAR", "RECADO"], nullable: true)
        //codigoArea2(nullable: true)
        //telefone2(nullable: true)
        //observacao2(nullable: true)
    }
}
