package linhasdecuidado
import useweb.*
class Procedimento {

    String codigo
    String nome
    
    static hasMany = [atendimentoconsulta:AtendimentoConsulta,lcareasubarea:LCAreaSubArea]
    
    
    static constraints = {
    }
    
    String toString() {
        return nome
    }
}
