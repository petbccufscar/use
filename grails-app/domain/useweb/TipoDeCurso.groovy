package useweb

class TipoDeCurso {
    
    static hasMany = [curso:Curso]
    
    String nome
    static constraints = {
    }
}
