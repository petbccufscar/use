package linhasdecuidado

class LinhaDeCuidado {

    String nome
    
    static hasMany = [linhadecuidadoarea:LinhadeCuidadoArea, relacoes:Relacoes]

    
    static constraints = {
    }
    
    String toString() {
        return nome
    }
}
