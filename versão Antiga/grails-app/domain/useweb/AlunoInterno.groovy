package useweb

class AlunoInterno extends Aluno{
    
    String ra
    Responsavel responsalve
    
    void setRa(String ra) {
        this.ra = ra.toUpperCase()
    }  
    
    static constraints = {
        ra(blank: false, nullable: false)     
    }
    
}
