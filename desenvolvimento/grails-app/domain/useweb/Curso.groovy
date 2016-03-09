package useweb

class Curso{ 
    
    static hasMany = [Aluno]  
    static belongsTo = [tipodecurso:TipoDeCurso, aluno:Aluno ]
    
    String nome
    
    static constraints = {
        aluno(nullable:true)
    }
}
