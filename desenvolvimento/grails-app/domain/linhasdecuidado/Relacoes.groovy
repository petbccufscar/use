package linhasdecuidado

class Relacoes {

    
    static belongsTo = [linhadecuidado:LinhaDeCuidado, area:Area, subarea:SubArea]
    
    static constraints = {
    }
}
