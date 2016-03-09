package useweb

class Preceptor extends Responsavel {
    
    static hasMany = [vinculopreceptor: VinculoPreceptor]
    
    Origem origem
    String cbo
    String conselhoCategoria
    String tipoOrigem
    Departamento departamento
    //String areaAtuacao
    
    static constraints = {
        
        cbo blank: false, nullable: false
        conselhoCategoria blank: false, nullable: false
        origem blank: false, nullable: false
          
    }
    
}
