package useweb

class TratamentoVigente {
    
    static belongsTo = [entrevistainicial:EntrevistaInicial]
   
    String nome
    String local
    
    static constraints = {
        entrevistainicial(nullable:true)
    }
}
