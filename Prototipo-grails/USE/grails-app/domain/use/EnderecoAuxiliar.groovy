package use

class EnderecoAuxiliar {

    static mapping = {
        id name : 'cep'
    }

    static constraints = {
    }

    String cep
    String logradouro
    String estado
    String cidade
    TipoLogradouro tipoLogradouro
}
