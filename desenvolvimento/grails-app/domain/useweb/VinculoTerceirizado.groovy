package useweb

class VinculoTerceirizado {

    static belongsTo = [terceirizado: Terceirizado,origem:Origem]
    
    Date dataInicio
    Date dataFim
    
    static constraints = {
    }
}
