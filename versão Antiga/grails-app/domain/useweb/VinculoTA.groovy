package useweb

class VinculoTA {

    static belongsTo = [tecnicos: TecnicoAdministrativo,departamento:Departamento]
    
    Date dataInicio
    Date dataTermino
    
    static constraints = {
        
        dataTermino nullable:true, blank:true
    }
    String toString(){
        
        return  dataInicio
    }
}
