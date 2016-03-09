package useweb

class VinculoUSE {
       
    static belongsTo = [colaborador:Colaborador]
    
    
    Date dataInicio
    Date dataTermino
    
    static constraints = {
    dataTermino nullable:true, blank:true
    }
    
    String toString(){
        
        return  dataInicio
    }
}
