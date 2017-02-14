package use

class Pessoa {

    static mapping = {
        id name: 'numeroCadastro'
    }

    static hasmany = [emails : Email, telefones: Telefone]

    static constraints = { //Aqui vão regras de validação
        nome (blank:true, size:1..20)
        cpf(nullable:false)
        rg(nullable:true)
        sexo(inList: ["F","M"])
    }

    String nomeCompleto
    Integer numeroCadastro
    String nomeSocial
    Date dataDeNascimento
    Date dataDeCadastro
    String cpf
    String rg
    String orgaoEmissor
    String sexo // Há uma classe sexo que será implementada
}
