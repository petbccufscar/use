package useweb

class Aluno extends Colaborador {
    
    static hasMany = [curso:Curso, estagio:Estagio, periododeresponsabilidade:PeriodoDeResponsabilidade]
    static constraints = {
    }
}
