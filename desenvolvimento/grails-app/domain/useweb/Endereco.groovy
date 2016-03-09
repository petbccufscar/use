package useweb

class Endereco {
    static belongsTo = [pessoa:Pessoa]
    
    String cep
    String tipoLogradouro
    String logradouro
    Integer numero
    String complemento
    String bairro
    String estado
    String cidade
    
 
    static constraints = {
        pessoa(nullable:true)
        cep(blank: false, nullable: false, cep:true)
        tipoLogradouro(blank: false, nullable: false)
        logradouro(blank: false, nullable: false)
        numero(nullable: false)
        //complemento(blank:true, nullable:true)
        bairro(blank: false, nullable: false)
        estado(blank: false, nullable: false)
        cidade(blank: false, nullable: false)
    }
    
    static Set estados
    static Set cidades

    static Collection estados() {
        estados = new TreeSet()
//        estados.add("")
        def temp = Cidade.findAll()
        temp.each { cidade ->
            estados.add(cidade.estado)
        }
        return estados
    }
    
    static Collection cidades() {
        cidades = new TreeSet()
//        cidades.add("")
        def temp = Cidade.findAll()
        temp.each { cidade ->
            cidades.add(cidade.nome)
        }
        return cidades
    }
    
    String toString(){
        
        return logradouro +" - "+ numero
    }
}
