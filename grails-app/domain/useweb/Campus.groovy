package useweb

class Campus {

    String nome
    
    static hasmany = [departamento:Departamento]
    
    static constraints = {
        nome()
   
    }
    
    String toString() {
        return nome
    }
}
