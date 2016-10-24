package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioController {
    
    int counter_email = 0;
    int add_delete_email = 0;
    int counter_telefone = 0;
    int add_delete_telefone = 0;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_USUARIO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Usuario.list(params), model:[usuarioInstanceCount: Usuario.count()]
    }
    
    @Secured(['ROLE_USUARIO_SHOW'])
    def show(Usuario usuarioInstance) {
        respond usuarioInstance
    }

    @Secured(['ROLE_USUARIO_ADD'])
    def create() {
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        respond new Usuario(params)
    }

    @Secured(['ROLE_USUARIO_ADD'])
    @Transactional
    def save(Usuario usuarioInstance) {
        
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'create'
            return
        }
        
        // Código responsavel por criar e e-mails
        def listaEmails = params.list('email')  
        for (int i = 0; i < listaEmails.size(); i++) {
            def emailInstance = new Email()
            emailInstance.email = listaEmails[i]
            usuarioInstance.addToEmails(emailInstance)
        }
            
        // Código responsavel por criar telefones
        def tipoTelefones = params.list('tipo')
        def codigoAreaTelefones = params.list('codArea')
        def telefoneTelefones = params.list('telefone')
        def observacaoTelefones = params.list('observacao')
        
        for (int j = 0; j < tipoTelefones.size(); j++) {
            def telefoneInstance = new Telefone()
                
            telefoneInstance.tipo = tipoTelefones[j]
            telefoneInstance.codigoArea = codigoAreaTelefones[j]
            telefoneInstance.telefone = telefoneTelefones[j]
            telefoneInstance.observacao = observacaoTelefones[j]

            usuarioInstance.addToTelefones(telefoneInstance)
        }
            
        // Código responsável pelo endereço
        
        def enderecoInstance = new Endereco(cep: params.cep, 
            tipoLogradouro: params.tipoLogradouro, 
            logradouro: params.logradouro, 
            numero: params.numero, 
            complemento: params.complemento, 
            bairro: params.bairro, 
            estado: params.estado, 
            cidade: params.cidade)
        
        usuarioInstance.addToEndereco(enderecoInstance)
        
        
        

        usuarioInstance.save(flush:true)

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioInstance.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*' { respond usuarioInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_USUARIO_EDIT'])
    def edit(Usuario usuarioInstance) {
        counter_email = 0;
        add_delete_email = 0;
         counter_telefone = 0;
         add_delete_telefone = 0;
        respond usuarioInstance
    }

    @Secured(['ROLE_USUARIO_EDIT'])
    @Transactional
    def update(Usuario usuarioInstance) {
        if (usuarioInstance == null) {
            notFound()
            return
        }

        if (usuarioInstance.hasErrors()) {
            respond usuarioInstance.errors, view:'edit'
            return
        }
        
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
        if (listaEmails.size() > usuarioInstance.emails.size()) {
            int value = listaEmails.size() - usuarioInstance.emails.size()
            for (int i = 0; i < value; i++) {
                def emailInstance = new Email()
                usuarioInstance.addToEmails(emailInstance)
            }
        } else {
            if (listaEmails.size() < usuarioInstance.emails.size()) {
                def value = usuarioInstance.emails.size() - listaEmails.size()
                List<Email> emails = new ArrayList<Email>()
                    
                usuarioInstance.emails.each { emailInstance ->
                    emails.add(emailInstance)
                }
                def emailsize = emails.size()
                for (int i = 0; i < value; i++) {                           
                    usuarioInstance.removeFromEmails(emails[emailsize - 1])
                    emails[emailsize - 1].delete(flush: true)
                    emailsize--
               
                }
            }
        }
            
        cont = 0
        usuarioInstance.emails.each { emailInstance ->
            emailInstance.email = listaEmails[cont++]
        }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
        if (listaTipoTelefones.size() > usuarioInstance.telefones.size()) {
            int value = listaTipoTelefones.size() - usuarioInstance.telefones.size()
            for (int i = 0; i < value; i++) {
                def telefoneInstance = new Telefone()
                    
                usuarioInstance.addToTelefones(telefoneInstance)
            }
        } else {
            if (listaTipoTelefones.size() < usuarioInstance.telefones.size()) {
                def value = usuarioInstance.telefones.size() - listaTipoTelefones.size()
                List<Telefone> telefones = new ArrayList<Telefone>()
                    
                usuarioInstance.telefones.each { telefoneInstance ->
                    telefones.add(telefoneInstance)
                }
                def telefonesize = telefones.size()
                for (int i = 0; i < value; i++) {                           
                    usuarioInstance.removeFromTelefones(telefones[telefonesize - 1])
                    telefones[telefonesize - 1].delete(flush: true)
                    telefonesize--
               
                }
            }
        }
        
        
        contTel = 0
        usuarioInstance.telefones.each { telefoneInstance ->
            telefoneInstance.tipo = listaTipoTelefones[contTel]
            telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
            telefoneInstance.telefone = listaTelefoneTelefones[contTel]
            telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
        }
            
        // Código responsável por atualizar o endereço
        
        usuarioInstance.endereco.each { enderecoInstance ->
            enderecoInstance.numero = params.int('numero')
            enderecoInstance.cep = params.cep
            enderecoInstance.tipoLogradouro = params.tipoLogradouro
            enderecoInstance.logradouro = params.logradouro
            enderecoInstance.complemento = params.complemento
            enderecoInstance.bairro = params.bairro
            enderecoInstance.estado = params.estado
            enderecoInstance.cidade = params.cidade       
        }
        
        usuarioInstance.save(flush:true)

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect usuarioInstance
            }
            '*'{ respond usuarioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_USUARIO_DEL'])
    @Transactional
    def delete(Usuario usuarioInstance) {

        if (usuarioInstance == null) {
            notFound()
            return
        }

        usuarioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioInstance.label', default: 'Usuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def addressByCEP() {
        
        def endereco = EnderecoConsulta.findByCep(params.cep)
        
        render template: '../busca_endereco',
        model: [endereco: endereco.getProperties()]
    }
    def addressByCEPcuidador() {
        
        def endereco = EnderecoConsulta.findByCep(params.cuidador_cep)
        render template: 'enderecocuidador', 
        model: [endereco: endereco.getProperties()]
    }
    def cuidadorrender(){
        render (template: 'formcuidador')
    }
    def cancelcuidador(){
        render template: 'upcuidador'
    }
    def createcuidador(){
        // >>>>>>>>>>>>>>>>>>>fazer validacoes
        
        def cuidador_create = new Cuidador(nome:params.cuidador_nome, dataNascimento:params.cuidador_dataNascimento, sexo:params.cuidador_sexo, cpf:params.cuidador_cpf, orgaoEmissor:params.cuidador_orgaoEmissor, rg:params.cuidador_rg, vinculo:params.cuidador_vinculo).save(); 
        
        // Código responsavel por criar e e-mails
        def listaEmails = params.list('cuidador_emails')  
        for (int i = 0; i < listaEmails.size(); i++) 
        def emailInstance = new Email(pessoa: cuidador_create, email:listaEmails[i]).save();
            
        // Código responsavel por criar telefones
        def tipoTelefones = params.list('cuidador_tipo')
        def codigoAreaTelefones = params.list('cuidador_codArea')
        def telefoneTelefones = params.list('cuidador_telefone')
        def observacaoTelefones = params.list('cuidador_observacao')
        for (int j = 0; j < tipoTelefones.size(); j++) 
            def telefoneInstance = new Telefone(pessoa:cuidador_create, tipo:tipoTelefones[j], codigoArea:codigoAreaTelefones[j], telefone:telefoneTelefones[j], observacao:observacaoTelefones[j]).save();      
       
         // Código responsável pelo endereço
        def enderecoInstance = new Endereco(pessoa:cuidador_create,
            cep: params.cuidador_cep, 
            tipoLogradouro: params.cuidador_tipoLogradouro, 
            logradouro: params.cuidador_logradouro, 
            numero: params.cuidador_numero, 
            complemento: params.cuidador_complemento, 
            bairro: params.cuidador_bairro, 
            estado: params.cuidador_estado, 
            cidade: params.cuidador_cidade).save();
                
        render template: 'upcuidador',
        model:[cuidadoredit: null]
    }
    def editcuidador(){
       def cuidadoredit =  Cuidador.findById(params.cuidador)
       render template: 'formcuidador',
       model: [cuidadoredit: cuidadoredit]
    }
        
     def add_email(Usuario usuarioInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'usuario';
        render (view:'../add_email', model:[Instance:usuarioInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
    }
    def delete_email(){
        def listaEmails = params.list('email')
        if (listaEmails.size() < 2){
        add_delete_email = 1;
        render (view:'../add_email', model: [counter_email:counter_email, add_delete_email:add_delete_email]) 
        }
        else{
        render ""
        }
    }
    
    def add_telefone(){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        [counter_telefone:counter_telefone, add_delete_telefone:add_delete_telefone]
    }
    def delete_telefone(){
        def listaTelefones = params.list('telefone')
        if (listaTelefones.size() < 2){
        add_delete_telefone = 1;
        render (view:'/add_telefone', model: [counter_telefone:counter_telefone, add_delete_telefone:add_delete_telefone])
        }
        else{
        render ""
        }
    }
    
    
}
