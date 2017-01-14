package useweb

class Telefone {
    static belongsTo = [pessoa: Pessoa]
    
    String tipo
    String codigoArea
    String telefone
    String observacao
    
   
    
    
    static constraints = {
        pessoa(nullable:true)
        tipo(blank: false, nullable: false, inList: ["Residencial", "Comercial", "Celular", "Recado"])
        codigoArea(blank: false, nullable: false)
        telefone(blank: false, nullable: false)
        observacao(nullable: true)
    }
    
    String toString() {
        return tipo + " - " + "(" + codigoArea + ") " + telefone
    }
}
