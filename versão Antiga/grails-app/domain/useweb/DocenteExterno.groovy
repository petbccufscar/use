package useweb

class DocenteExterno extends Docente {
    
    static hasMany = [vinculodocenteexterno:VinculoDocenteExterno]
    Origem origem

    static constraints = {
        origem nullable:true
    }
}
