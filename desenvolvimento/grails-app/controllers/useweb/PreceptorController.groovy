package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * PreceptorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class PreceptorController {
    int counter_vinculouse = 0;
    int add_delete_vinculouse = 0;
    int counter_email = 0;
    int add_delete_email = 0;
    int counter_telefone = 0;
    int add_delete_telefone = 0;
    int Numdata = 0;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Preceptor.list(params), model:[preceptorInstanceCount: Preceptor.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Preceptor.list(params), model:[preceptorInstanceCount: Preceptor.count()]
    }

    def show(Preceptor preceptorInstance) {
        respond preceptorInstance
    }

    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new Preceptor(params)
    }

    @Transactional
    def save(Preceptor preceptorInstance) {
        if (preceptorInstance == null) {
            notFound()
            return
        }

        if (preceptorInstance.hasErrors()) {
            respond preceptorInstance.errors, view:'create'
            return
        }
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                preceptorInstance.addToEmails(emailInstance)
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

                preceptorInstance.addToTelefones(telefoneInstance)
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
        
        preceptorInstance.addToEndereco(enderecoInstance)
        
         // Código responsavel por criar vinculosuse
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
        
            for (int i = 0; i < listadataInicio.size(); i++) {
                def vinculosuseInstance = new VinculoUSE()
                vinculosuseInstance.dataInicio = listadataInicio[i]
                vinculosuseInstance.dataTermino = listadataTermino[i]
                preceptorInstance.addToVinculosuse(vinculosuseInstance)
            }
            
       // Código responsável pelo vinculo Preceptor
        
        def vinculoPreceptorInstance = new VinculoPreceptor(departamentos: params.departamento, 
                                            dataInicio: params.dataIniciovinculoPreceptor, 
                                            dataFim: params.dataTerminovinculoPreceptor)
        
        preceptorInstance.addToVinculopreceptor(vinculoPreceptorInstance)
            

        preceptorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'preceptorInstance.label', default: 'Preceptor'), preceptorInstance.id])
                redirect preceptorInstance
            }
            '*' { respond preceptorInstance, [status: CREATED] }
        }
    }

    def edit(Preceptor preceptorInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Preceptor p;
        p = Preceptor.get(params.id);
        Numdata = p.vinculosuse.size()-1;
        respond preceptorInstance
    }

    @Transactional
    def update(Preceptor preceptorInstance) {
        if (preceptorInstance == null) {
            notFound()
            return
        }

        if (preceptorInstance.hasErrors()) {
            respond preceptorInstance.errors, view:'edit'
            return
        }
         // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > preceptorInstance.emails.size()) {
                int value = listaEmails.size() - preceptorInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    preceptorInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < preceptorInstance.emails.size()) {
                    def value = preceptorInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    preceptorInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        preceptorInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            preceptorInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
            if (listaTipoTelefones.size() > preceptorInstance.telefones.size()) {
                int value = listaTipoTelefones.size() - preceptorInstance.telefones.size()
                for (int i = 0; i < value; i++) {
                    def telefoneInstance = new Telefone()
                    
                    preceptorInstance.addToTelefones(telefoneInstance)
                }
            } else {
                if (listaTipoTelefones.size() < preceptorInstance.telefones.size()) {
                    def value = preceptorInstance.telefones.size() - listaTipoTelefones.size()
                    List<Telefone> telefones = new ArrayList<Telefone>()
                    
                    preceptorInstance.telefones.each { telefoneInstance ->
                        telefones.add(telefoneInstance)
                    }
                    def telefonesize = telefones.size()
                    for (int i = 0; i < value; i++) {                           
                        preceptorInstance.removeFromTelefones(telefones[telefonesize - 1])
                        telefones[telefonesize - 1].delete(flush: true)
                        telefonesize--
               
                    }
                }
            }
        
        
        contTel = 0
            preceptorInstance.telefones.each { telefoneInstance ->
                telefoneInstance.tipo = listaTipoTelefones[contTel]
                telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
                telefoneInstance.telefone = listaTelefoneTelefones[contTel]
                telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
            }
            
        // Código responsável por atualizar o endereço
        
        preceptorInstance.endereco.each { enderecoInstance ->
            enderecoInstance.numero = params.int('numero')
            enderecoInstance.cep = params.cep
            enderecoInstance.tipoLogradouro = params.tipoLogradouro
            enderecoInstance.logradouro = params.logradouro
            enderecoInstance.complemento = params.complemento
            enderecoInstance.bairro = params.bairro
            enderecoInstance.estado = params.estado
            enderecoInstance.cidade = params.cidade       
        }
        
        // Código responsavel por editar e excluir os vinculos use
        
        int contvinculo = 0
        
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
      
            if (listadataInicio.size() > preceptorInstance.vinculosuse.size()) {
                int value = listadataInicio.size() - preceptorInstance.vinculosuse.size()
                for (int i = 0; i < value; i++) {
                    def vinculosuseInstance = new VinculoUSE()         
                    preceptorInstance.addToVinculosuse(vinculosuseInstance)
                }
            } else {
                if (listadataInicio.size() < preceptorInstance.vinculosuse.size()) {
                    def value = preceptorInstance.vinculosuse.size() - listadataInicio.size()
                    List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                    preceptorInstance.vinculosuse.each { vinculosuseInstance ->
                        vinculosuse.add(vinculosuseInstance)
                    }
                    def vinculosuseize = vinculosuse.size()
                    for (int i = 0; i < value; i++) {                           
                        preceptorInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                        vinculosuse[vinculosuseize - 1].delete(flush: true)
                        vinculosuseize--
               
                    }
                }
            }   

        contvinculo = 0
            preceptorInstance.vinculosuse.each { vinculosuseInstance ->
                vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
                vinculosuseInstance.dataFim = listadataTermino[contvinculo++]
            }
        
        // Código responsável por atualizar os vinculos Preceptor
        def departamentoget = Departamento.get(params.departamento.id)
        preceptorInstance.vinculopreceptor.each { vinculopreceptorInstance ->
            vinculopreceptorInstance.departamento = departamentoget
            vinculopreceptorInstance.dataInicio = params.dataIniciovinculoPreceptor
            vinculopreceptorInstance.dataTermino = params.dataTerminovinculoPreceptor    
        }
        
        preceptorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Preceptor.label', default: 'Preceptor'), preceptorInstance.id])
                redirect preceptorInstance
            }
            '*'{ respond preceptorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Preceptor preceptorInstance) {

        if (preceptorInstance == null) {
            notFound()
            return
        }

        preceptorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Preceptor.label', default: 'Preceptor'), preceptorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'preceptorInstance.label', default: 'Preceptor'), params.id])
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

    def add_vinculouse(Preceptor PInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'preceptor';
        render (view:'../add_vinculoUSE', model:[Instance:PInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
    }
    def delete_vinculouse(){
        int listaVinculouses = 0;
        for (int i = 0; i < Numdata+1 ; i++){
            if (params.("dataInicio_" + i) != null)
                listaVinculouses++;
        }
        if (listaVinculouses < 2){
            add_delete_vinculouse = 1;
            render (view:'../add_vinculouse', model: [counter_vinculouse:counter_vinculouse, add_delete_vinculouse:add_delete_vinculouse,  Numdata:Numdata])
        }
        else{
            render ""
        }
    }

    def add_email(Preceptor PInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'preceptor';
        render (view:'../add_email', model:[Instance:PInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(Preceptor PInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'preceptor';
        render (view:'../add_telefone', model:[Instance:PInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
    }
    def delete_telefone(){
        def listaTelefones = params.list('telefone')
        if (listaTelefones.size() < 2){
            add_delete_telefone = 1;
            render (view:'../add_telefone', model: [counter_telefone:counter_telefone, add_delete_telefone:add_delete_telefone])
        }
        else{
            render ""
        }
    }
}
