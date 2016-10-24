package useweb

class Colaborador extends Pessoa {
    Boolean voluntario
    String login
    String senha
    
    static hasMany = [vinculosuse:VinculoUSE]
    static constraints = {
        
        voluntario blank: false, nullable: false
    }
    static mapping = {
        tablePerHierarchy false
    }
}
