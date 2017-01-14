package useweb

class Usuario extends Pessoa {
    static hasMany = [registrousuario:RegistroUsuario,atendimentoconsulta:AtendimentoConsulta,cuidador:Cuidador, entrevistainicial:EntrevistaInicial]
    
    TecnicoAdministrativo tecnicoadministrativo
    
    String cns
    String nomeMae
    String corRaca
    String etnia
    String escolaridade
    String profissao
    String statusProfissao
    
    void setCns(String cns) {
        this.cns = cns.toUpperCase()
    }
    
    void setNomeMae(String nomeMae) {
        this.nomeMae = nomeMae.toUpperCase()
    }    
    
    void setCorRaca(String corRaca) {
        if (corRaca != null) {
            this.corRaca = corRaca.toUpperCase()
        } else {
            this.corRaca = corRaca
        }
    }
    
    void setEtnia(String etnia) {
        if (etnia != null) {
            this.etnia = etnia.toUpperCase()
        } else {
            this.etnia = etnia
        }
    }
    
    void setEscolaridade(String escolaridade) {
        if (escolaridade != null) {
            this.escolaridade = escolaridade.toUpperCase()
        } else {
            this.escolaridade = escolaridade
        }
    }
    
    void setProfissao(String profissao) {
        if (profissao != null) {
            this.profissao = profissao.toUpperCase()
        } else {
            this.profissao = profissao
        }
    }
    
    void setStatusProfissao(String statusProfissao) {
        if (statusProfissao != null) {
            this.statusProfissao = statusProfissao.toUpperCase()
        } else {
            this.statusProfissao = statusProfissao
        }
    }
    
    static constraints = {
        cuidador(blank: true, nullable: true)
        cns(unique: true, blank: false, nullable: false)
        nomeMae(blank: false, nullable: true)
        corRaca(inList: ["BRANCA", "PRETA", "PARDA", "AMARELA", "INDÍGENA", "NÃO INFORMADA"], blank: false, nullable: true)
        etnia(blank: true, nullable: true)
        escolaridade()
        profissao()
        statusProfissao(inList: ["ATIVO", "AFASTADO", "APOSENTADO"], blank: false, nullable: true)
    }
    
    static mapping = {
        //cuidadores sort: 'id'
    }
}
