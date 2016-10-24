package linhasdecuidado

class Area {

    String nome
    
    static hasMany = [linhadecuidadoarea:LinhadeCuidadoArea, relacoes:Relacoes]
  
    
    static constraints = {
        nome()
   
    }
    
    String toString() {
        return nome
    }
}
