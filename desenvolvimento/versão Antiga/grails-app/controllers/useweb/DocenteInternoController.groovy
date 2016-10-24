package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DocenteInternoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DocenteInternoController {
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
        respond DocenteInterno.list(params), model:[docenteInternoInstanceCount: DocenteInterno.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocenteInterno.list(params), model:[docenteInternoInstanceCount: DocenteInterno.count()]
    }

    def show(DocenteInterno docenteInternoInstance) {
        respond docenteInternoInstance
    }

    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new DocenteInterno(params)
    }

    @Transactional
    def save(DocenteInterno docenteInternoInstance) {
        if (docenteInternoInstance == null) {
            notFound()
            return
        }

        if (docenteInternoInstance.hasErrors()) {
            respond docenteInternoInstance.errors, view:'create'
            return
        }
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                docenteInternoInstance.addToEmails(emailInstance)
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

                docenteInternoInstance.addToTelefones(telefoneInstance)
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
         docenteInternoInstance.addToEndereco(enderecoInstance)
         
        // Código responsavel por criar vinculosuse
        println params
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
        
            for (int i = 0; i < listadataInicio.size(); i++) {
                def vinculosuseInstance = new VinculoUSE()
                vinculosuseInstance.dataInicio = listadataInicio[i]
                vinculosuseInstance.dataTermino = listadataTermino[i]
                docenteInternoInstance.addToVinculosuse(vinculosuseInstance)
            }
            
        
            // Código responsável pelo vinculo Docente Interno
        
        def vinculoDInstance = new VinculoDocenteInterno(departamentos: params.departamento, 
                                            dataDeInicio: params.dataIniciovinculoDocenteInterno, 
                                            datadeTermino: params.dataTerminovinculoDocenteInterno)
        println params.departamento
        println params.dataIniciovinculoDocenteInterno
        println params.dataTerminovinculoDocenteInterno
        docenteInternoInstance.addToVinculodocenteinterno(vinculoDInstance)
        
        docenteInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'docenteInternoInstance.label', default: 'DocenteInterno'), docenteInternoInstance.id])
                redirect docenteInternoInstance
            }
            '*' { respond docenteInternoInstance, [status: CREATED] }
        }
    }

    def edit(DocenteInterno docenteInternoInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        DocenteInterno di;
        di = DocenteInterno.get(params.id);
        Numdata = di.vinculosuse.size()-1;
        respond docenteInternoInstance
    }

    @Transactional
    def update(DocenteInterno docenteInternoInstance) {
        if (docenteInternoInstance == null) {
            notFound()
            return
        }

        if (docenteInternoInstance.hasErrors()) {
            respond docenteInternoInstance.errors, view:'edit'
            return
        }
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > docenteInternoInstance.emails.size()) {
                int value = listaEmails.size() - docenteInternoInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    docenteInternoInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < docenteInternoInstance.emails.size()) {
                    def value = docenteInternoInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    docenteInternoInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        docenteInternoInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            docenteInternoInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
            if (listaTipoTelefones.size() > docenteInternoInstance.telefones.size()) {
                int value = listaTipoTelefones.size() - docenteInternoInstance.telefones.size()
                for (int i = 0; i < value; i++) {
                    def telefoneInstance = new Telefone()
                    
                    docenteInternoInstance.addToTelefones(telefoneInstance)
                }
            } else {
                if (listaTipoTelefones.size() < docenteInternoInstance.telefones.size()) {
                    def value = docenteInternoInstance.telefones.size() - listaTipoTelefones.size()
                    List<Telefone> telefones = new ArrayList<Telefone>()
                    
                    docenteInternoInstance.telefones.each { telefoneInstance ->
                        telefones.add(telefoneInstance)
                    }
                    def telefonesize = telefones.size()
                    for (int i = 0; i < value; i++) {                           
                        docenteInternoInstance.removeFromTelefones(telefones[telefonesize - 1])
                        telefones[telefonesize - 1].delete(flush: true)
                        telefonesize--
               
                    }
                }
            }
        
        
        contTel = 0
            docenteInternoInstance.telefones.each { telefoneInstance ->
                telefoneInstance.tipo = listaTipoTelefones[contTel]
                telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
                telefoneInstance.telefone = listaTelefoneTelefones[contTel]
                telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
            }
            
        // Código responsável por atualizar o endereço
        
        docenteInternoInstance.endereco.each { enderecoInstance ->
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
      
            if (listadataInicio.size() > docenteInternoInstance.vinculosuse.size()) {
                int value = listadataInicio.size() - docenteInternoInstance.vinculosuse.size()
                for (int i = 0; i < value; i++) {
                    def vinculosuseInstance = new VinculoUSE()         
                    docenteInternoInstance.addToVinculosuse(vinculosuseInstance)
                }
            } else {
                if (listadataInicio.size() < docenteInternoInstance.vinculosuse.size()) {
                    def value = docenteInternoInstance.vinculosuse.size() - listadataInicio.size()
                    List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                    docenteInternoInstance.vinculosuse.each { vinculosuseInstance ->
                        vinculosuse.add(vinculosuseInstance)
                    }
                    def vinculosuseize = vinculosuse.size()
                    for (int i = 0; i < value; i++) {                           
                        docenteInternoInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                        vinculosuse[vinculosuseize - 1].delete(flush: true)
                        vinculosuseize--
               
                    }
                }
            }   

        contvinculo = 0
            docenteInternoInstance.vinculosuse.each { vinculosuseInstance ->
                vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
                vinculosuseInstance.dataTermino = listadataTermino[contvinculo++]
            }
        
        // Código responsável por atualizar os vinculos Docente Interno
        def departamentoget = Departamento.get(params.departamento.id)
        docenteInternoInstance.vinculodocenteinterno.each { vinculodocenteinternoInstance ->
            vinculodocenteinternoInstance.departamento = departamentoget
            vinculodocenteinternoInstance.dataDeInicio = params.dataIniciovinculoDocenteInterno
            vinculodocenteinternoInstance.datadeTermino = params.dataTerminovinculoDocenteInterno    
        }
        
        docenteInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocenteInterno.label', default: 'DocenteInterno'), docenteInternoInstance.id])
                redirect docenteInternoInstance
            }
            '*'{ respond docenteInternoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocenteInterno docenteInternoInstance) {

        if (docenteInternoInstance == null) {
            notFound()
            return
        }

        docenteInternoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocenteInterno.label', default: 'DocenteInterno'), docenteInternoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'docenteInternoInstance.label', default: 'DocenteInterno'), params.id])
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

    def add_vinculouse(DocenteInterno DIInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'docenteInterno';
        render (view:'../add_vinculoUSE', model:[Instance:DIInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
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

    def add_email(DocenteInterno DIInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'docenteInterno';
        render (view:'../add_email', model:[Instance:DIInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(DocenteInterno DIInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'docenteInterno';
        render (view:'../add_telefone', model:[Instance:DIInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
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
