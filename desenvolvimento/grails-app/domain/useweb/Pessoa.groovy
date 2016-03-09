package useweb

class Pessoa {
    static hasMany = [telefones: Telefone, emails: Email, endereco: Endereco]
    
    String nome
    Date dataNascimento
    String sexo
    String cpf
    String rg
    String orgaoEmissor
    
   
    // validator: {it < new Date()}
    static constraints = {
        nome blank: false, nullable: false
        dataNascimento nullable: false
        sexo inList: ["FEMININO", "MASCULINO", "NÃO INFORMADO"], blank: false, nullable: false
        cpf blank: false, cpf: true
       
    }
    
    static mapping = {
        emails sort: 'id'
        telefones sort: 'id'
        tablePerHierarchy false
    }
    
    String toString() {
        return nome
    }
}
