package useweb
import linhasdecuidado.*

class AtendimentoConsulta {

    static belongsTo = [usuario:Usuario,procedimento:Procedimento]
    static hasMany = [procedimento:Procedimento]
    
    Responsavel responsavel
    Date dataConsulta
    float horaInicio
    float horaTermino
    String Conduta
    
    LCAreaSubAreaAcao lcareasubareaacao
    
    static constraints = {
    }
}
