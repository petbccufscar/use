package linhasdecuidado

class SubArea {

    String nome
    
    static hasMany = [lcareasubarea:LCAreaSubArea, relacoes:Relacoes]
    
    
    static constraints = {
       nome()
    }
    
    String toString() {
        return  nome
    }
}