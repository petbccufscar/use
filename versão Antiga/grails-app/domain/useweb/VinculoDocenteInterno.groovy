package useweb

class VinculoDocenteInterno {
    static belongsTo = [docentes: DocenteInterno, departamentos: Departamento]

    static constraints = {
       departamentos blank: false, nullable: false
    }
    
    Date dataDeInicio
    Date datadeTermino
}
