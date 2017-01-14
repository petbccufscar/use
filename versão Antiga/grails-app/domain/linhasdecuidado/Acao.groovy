package linhasdecuidado
import useweb.*

class Acao {

   
    String nome
    String descricao
    
  
    static hasMany = [LCAreaSubAreaAcao,AtendimentoConsulta, PeriodoDeResponsabilidade]
    
    static constraints = {
        nome()
        descricao()
        
    }
    
    String toString() {
        return nome
    }
}
