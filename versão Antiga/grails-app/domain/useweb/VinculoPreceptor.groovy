package useweb

class VinculoPreceptor {

    static belongsTo = [departamento:Departamento,preceptor:Preceptor]
    
    Date dataInicio
    Date dataFim
    
    static constraints = {
    }
}
