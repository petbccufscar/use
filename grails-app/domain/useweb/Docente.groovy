package useweb

class Docente extends Responsavel {

    static constraints = {
        cbo blank: false
        conselhoCategoria blank: false, size: 1..20
    }
    
    String cbo
    String conselhoCategoria
}
