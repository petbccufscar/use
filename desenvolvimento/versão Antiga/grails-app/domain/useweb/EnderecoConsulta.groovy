package useweb

class EnderecoConsulta {
    String cep
    String tipoLogradouro
    String logradouro
    String bairro
    String estado
    String cidade
    
    
    
    static constraints = {
        cep(blank: false, nullable: false)
        tipoLogradouro(blank: false, nullable: true)
        logradouro(blank: false, nullable: true)
        bairro(blank: false, nullable: true)
        estado(blank: false, nullable: false)
        cidade(blank: false, nullable: false)
    }
}
