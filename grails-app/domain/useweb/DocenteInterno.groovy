package useweb
class DocenteInterno extends Docente {
    
    static hasMany = [vinculodocenteinterno:VinculoDocenteInterno]

    Departamento departamento
    String siape
    
    static constraints = {
        siape (blank:false, size: 1..30)
    }
    
    
}
