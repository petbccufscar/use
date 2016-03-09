package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DocenteExternoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DocenteExternoController {
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
        respond DocenteExterno.list(params), model:[docenteExternoInstanceCount: DocenteExterno.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocenteExterno.list(params), model:[docenteExternoInstanceCount: DocenteExterno.count()]
    }

    def show(DocenteExterno docenteExternoInstance) {
        respond docenteExternoInstance
    }

    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new DocenteExterno(params)
    }

    @Transactional
    def save(DocenteExterno docenteExternoInstance) {
        if (docenteExternoInstance == null) {
            notFound()
            return
        }

        if (docenteExternoInstance.hasErrors()) {
            respond docenteExternoInstance.errors, view:'create'
            return
        }
        def listaEmails = params.list('email')  
        for (int i = 0; i < listaEmails.size(); i++) {
            def emailInstance = new Email()
            emailInstance.email = listaEmails[i]
            docenteExternoInstance.addToEmails(emailInstance)
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

            docenteExternoInstance.addToTelefones(telefoneInstance)
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
        docenteExternoInstance.addToEndereco(enderecoInstance)
       
        // Código responsavel por criar vinculosuse
        println params
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
        
        for (int i = 0; i < listadataInicio.size(); i++) {
            def vinculosuseInstance = new VinculoUSE()
            vinculosuseInstance.dataInicio = listadataInicio[i]
            vinculosuseInstance.dataTermino = listadataTermino[i]
            docenteExternoInstance.addToVinculosuse(vinculosuseInstance)
        }
            
        // Código responsável pelo vinculo Docente Externo
        
        def vinculoDInstance = new VinculoDocenteExterno(origem: params.origem, 
            dataInicio: params.dataIniciovinculoDocenteExterno, 
            dataFim: params.dataTerminovinculoDocenteExterno)
        
        docenteExternoInstance.addToVinculodocenteexterno(vinculoDInstance)
            
        
        docenteExternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'docenteExternoInstance.label', default: 'DocenteExterno'), docenteExternoInstance.id])
                redirect docenteExternoInstance
            }
            '*' { respond docenteExternoInstance, [status: CREATED] }
        }
    }

    def edit(DocenteExterno docenteExternoInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        DocenteExterno de;
        de = DocenteExterno.get(params.id);
        Numdata = de.vinculosuse.size()-1;
        respond docenteExternoInstance
    }

    @Transactional
    def update(DocenteExterno docenteExternoInstance) {
        if (docenteExternoInstance == null) {
            notFound()
            return
        }

        if (docenteExternoInstance.hasErrors()) {
            respond docenteExternoInstance.errors, view:'edit'
            return
        }
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
        if (listaEmails.size() > docenteExternoInstance.emails.size()) {
            int value = listaEmails.size() - docenteExternoInstance.emails.size()
            for (int i = 0; i < value; i++) {
                def emailInstance = new Email()
                docenteExternoInstance.addToEmails(emailInstance)
            }
        } else {
            if (listaEmails.size() < docenteExternoInstance.emails.size()) {
                def value = docenteExternoInstance.emails.size() - listaEmails.size()
                List<Email> emails = new ArrayList<Email>()
                    
                docenteExternoInstance.emails.each { emailInstance ->
                    emails.add(emailInstance)
                }
                def emailsize = emails.size()
                for (int i = 0; i < value; i++) {                           
                    docenteExternoInstance.removeFromEmails(emails[emailsize - 1])
                    emails[emailsize - 1].delete(flush: true)
                    emailsize--
               
                }
            }
        }
            
        cont = 0
        docenteExternoInstance.emails.each { emailInstance ->
            emailInstance.email = listaEmails[cont++]
        }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
        if (listaTipoTelefones.size() > docenteExternoInstance.telefones.size()) {
            int value = listaTipoTelefones.size() - docenteExternoInstance.telefones.size()
            for (int i = 0; i < value; i++) {
                def telefoneInstance = new Telefone()
                    
                docenteExternoInstance.addToTelefones(telefoneInstance)
            }
        } else {
            if (listaTipoTelefones.size() < docenteExternoInstance.telefones.size()) {
                def value = docenteExternoInstance.telefones.size() - listaTipoTelefones.size()
                List<Telefone> telefones = new ArrayList<Telefone>()
                    
                docenteExternoInstance.telefones.each { telefoneInstance ->
                    telefones.add(telefoneInstance)
                }
                def telefonesize = telefones.size()
                for (int i = 0; i < value; i++) {                           
                    docenteExternoInstance.removeFromTelefones(telefones[telefonesize - 1])
                    telefones[telefonesize - 1].delete(flush: true)
                    telefonesize--
               
                }
            }
        }
        
        
        contTel = 0
        docenteExternoInstance.telefones.each { telefoneInstance ->
            telefoneInstance.tipo = listaTipoTelefones[contTel]
            telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
            telefoneInstance.telefone = listaTelefoneTelefones[contTel]
            telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
        }
            
        // Código responsável por atualizar o endereço
        
        docenteExternoInstance.endereco.each { enderecoInstance ->
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
      
        if (listadataInicio.size() > docenteExternoInstance.vinculosuse.size()) {
            int value = listadataInicio.size() - docenteExternoInstance.vinculosuse.size()
            for (int i = 0; i < value; i++) {
                def vinculosuseInstance = new VinculoUSE()         
                docenteExternoInstance.addToVinculosuse(vinculosuseInstance)
            }
        } else {
            if (listadataInicio.size() < docenteExternoInstance.vinculosuse.size()) {
                def value = docenteExternoInstance.vinculosuse.size() - listadataInicio.size()
                List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                docenteExternoInstance.vinculosuse.each { vinculosuseInstance ->
                    vinculosuse.add(vinculosuseInstance)
                }
                def vinculosuseize = vinculosuse.size()
                for (int i = 0; i < value; i++) {                           
                    docenteExternoInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                    vinculosuse[vinculosuseize - 1].delete(flush: true)
                    vinculosuseize--
               
                }
            }
        }   

        contvinculo = 0
        docenteExternoInstance.vinculosuse.each { vinculosuseInstance ->
            vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
            vinculosuseInstance.dataTermino = listadataTermino[contvinculo++]
        }
            
        // Código responsavel por atualizar vinculo Docente Externo
        def origemget = Origem.get(params.origem.id)
        docenteExternoInstance.vinculodocenteexterno.each { vinculodocenteexternoInstance ->
            vinculodocenteexternoInstance.origem = origemget
            vinculodocenteexternoInstance.dataInicio = params.dataIniciovinculoDocenteExterno
            vinculodocenteexternoInstance.dataFim = params.dataTerminovinculoDocenteExterno    
        }
        
        docenteExternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocenteExterno.label', default: 'DocenteExterno'), docenteExternoInstance.id])
                redirect docenteExternoInstance
            }
            '*'{ respond docenteExternoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocenteExterno docenteExternoInstance) {

        if (docenteExternoInstance == null) {
            notFound()
            return
        }

        docenteExternoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocenteExterno.label', default: 'DocenteExterno'), docenteExternoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'docenteExternoInstance.label', default: 'DocenteExterno'), params.id])
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

    def add_vinculouse(DocenteExterno DEInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'docenteExterno';
        render (view:'../add_vinculoUSE', model:[Instance:DEInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
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

    def add_email(DocenteExterno DEInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'docenteExterno';
        render (view:'../add_email', model:[Instance:DEInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(DocenteExterno DEInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'docenteExterno';
        render (view:'../add_telefone', model:[Instance:DEInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
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