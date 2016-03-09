package useweb
class Terceirizado extends Colaborador {

	static hasMany = [vinculotercerizado:VinculoTerceirizado]
   Origem origem
    
    String codigo
    
    static constraints = {
        origem nullable: true, blank: true
    }
}
