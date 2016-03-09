package linhasdecuidado
import useweb.*

class LCAreaSubAreaAcao {
    
    static belongsTo = [lcareasubarea:LCAreaSubArea, acao:Acao]
    static hasMany = [registrousuario:RegistroUsuario]
    
    
}
