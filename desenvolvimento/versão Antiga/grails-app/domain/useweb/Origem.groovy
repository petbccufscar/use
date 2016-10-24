package useweb
class Origem {
    
    static hasMany = [VinculoDocenteExterno,VinculoTerceirizado]
   
    
    String nome
    
    static constraints = {
      	
    }
    
    String toString(){
        
        return nome
    }
}
