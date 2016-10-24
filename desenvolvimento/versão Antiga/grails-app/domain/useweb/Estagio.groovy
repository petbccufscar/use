package useweb

class Estagio {

    static belongsTo = [aluno:Aluno]
    
    Date dataDeInicio
    Date dataDeTermino
    
    static constraints = {
    }
}
