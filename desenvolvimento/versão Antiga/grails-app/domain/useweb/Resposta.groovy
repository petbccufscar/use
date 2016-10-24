package useweb

class Resposta {
    
    static belongsTo = [entrevistainicial:EntrevistaInicial]
    Questao questao
    
    String texto
    
    static constraints = {
        entrevistainicial(nullable:true)
    }
}
