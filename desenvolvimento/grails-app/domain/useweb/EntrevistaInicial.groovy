package useweb

class EntrevistaInicial {
    Date data
    
    static hasMany = [tratamentovigente:TratamentoVigente, resposta:Resposta, questao:Questao]
    static belongsTo = [usuario:Usuario]
   
    
    Colaborador colaborador
    
    static constraints = {
        colaborador(nullable:true)
        
    }
}
