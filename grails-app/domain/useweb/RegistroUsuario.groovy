package useweb
import linhasdecuidado.*

class RegistroUsuario {

     static belongsTo = [usuario:Usuario, lcareasubareaacao:LCAreaSubAreaAcao]
    
    Colaborador colaborador
    Date dataDeInicio
    Date dataDeTermino
    
    
    static constraints = {
    }
}
