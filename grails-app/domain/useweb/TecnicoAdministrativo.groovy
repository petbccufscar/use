package useweb

class TecnicoAdministrativo extends Colaborador {
   
    static hasMany = [vinculota:VinculoTA, usuario:Usuario]

    
    String cargo
    String cbo
    String conselhoCategoria
    String siape
    Departamento departamento
    
    
    
    static constraints = {
        cargo blank: false, nullable: false
        cbo blank: false, nullable: false
        conselhoCategoria blank: false, nullable: true
        siape blank: false, nullable: false
       
    }
}
