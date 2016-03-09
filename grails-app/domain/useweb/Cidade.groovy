package useweb

class Cidade {
    String nome
    String estado
    
    void setNome(String nome) {
        this.nome = nome.toUpperCase()
    }
    
    void setEstado(String estado) {
        this.estado = estado.toUpperCase()
    }
    
    static constraints = {
        nome(blank: false, size: 1..80)
        estado(blank: false, size: 2..2)
    }
    
    String toString() {
        return nome
    }
}
