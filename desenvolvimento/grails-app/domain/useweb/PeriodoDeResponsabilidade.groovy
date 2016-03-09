package useweb

class PeriodoDeResponsabilidade {

    static belongsTo = [responsavel:Responsavel, aluno:Aluno]
    
    Date dataDeInicio
    Date dataDeTermino
    
    static constraints = {
    }
}
