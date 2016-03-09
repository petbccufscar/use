package useweb

class Departamento {

    static hasMany = [VinculoDocenteInterno,VinculoTA,VinculoPreceptor]
    static belongsTo = [campus:Campus]
    
    String nome

    static constraints = {
    }
        
    

    String toString(){

    	return nome
    }
}
