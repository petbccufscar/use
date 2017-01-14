package useweb

class VinculoDocenteExterno {

	static belongsTo = [docenteexterno:DocenteExterno,origem:Origem]
	
    Date dataInicio
    Date dataFim
    //String _origem
    
    static constraints = {
        //_origem inList: ["Posto de Saúde"], blank: false, nullable: false
        
    }
}
