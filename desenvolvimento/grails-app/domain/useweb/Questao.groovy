package useweb

class Questao {

    static hasMany = [EntrevistaInicial]
    static belongsTo = [entrevistainicial:EntrevistaInicial]
    static hasOne = [resposta:Resposta]
    
    String texto
    
    static constraints = {
        resposta unique: true
        resposta(nullable:true)
        entrevistainicial(nullable:true)
    }
}
