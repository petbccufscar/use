package useweb

class Email {
    static belongsTo = [pessoa: Pessoa]
    
    String email
    
    static constraints = {
        pessoa(nullable:true)
        email(email:true, blank:false, nullable:false)
    }
    
    String toString() {
        return email
    }
}
