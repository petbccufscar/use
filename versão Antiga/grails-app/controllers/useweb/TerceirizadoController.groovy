package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * TerceirizadoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class TerceirizadoController {
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
        respond Terceirizado.list(params), model:[terceirizadoInstanceCount: Terceirizado.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Terceirizado.list(params), model:[terceirizadoInstanceCount: Terceirizado.count()]
    }

    def show(Terceirizado terceirizadoInstance) {
        respond terceirizadoInstance
    }

    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new Terceirizado(params)
    }

    @Transactional
    def save(Terceirizado terceirizadoInstance) {
        if (terceirizadoInstance == null) {
            notFound()
            return
        }

        if (terceirizadoInstance.hasErrors()) {
            respond terceirizadoInstance.errors, view:'create'
            return
        }
        // Código responsavel por criar e e-mails
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                terceirizadoInstance.addToEmails(emailInstance)
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

                terceirizadoInstance.addToTelefones(telefoneInstance)
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
        
        terceirizadoInstance.addToEndereco(enderecoInstance)
        
         // Código responsavel por criar vinculosuse
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
        
            for (int i = 0; i < listadataInicio.size(); i++) {
                def vinculosuseInstance = new VinculoUSE()
                vinculosuseInstance.dataInicio = listadataInicio[i]
                vinculosuseInstance.dataTermino = listadataTermino[i]
                terceirizadoInstance.addToVinculosuse(vinculosuseInstance)
            }
            
        // Código responsável pelo vinculo terceirizado
        
        def vinculoterceirizadoInstance = new VinculoTerceirizado(origem: params.origem, 
                                            dataInicio: params.dataIniciovinculoterceirizado, 
                                            dataFim: params.dataTerminovinculoterceirizado)
        
        terceirizadoInstance.addToVinculotercerizado(vinculoterceirizadoInstance)
        
        terceirizadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'terceirizadoInstance.label', default: 'Terceirizado'), terceirizadoInstance.id])
                redirect terceirizadoInstance
            }
            '*' { respond terceirizadoInstance, [status: CREATED] }
        }
    }

    def edit(Terceirizado terceirizadoInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Terceirizado t;
        t = Terceirizado.get(params.id);
        Numdata = t.vinculosuse.size()-1;
        respond terceirizadoInstance
    }

    @Transactional
    def update(Terceirizado terceirizadoInstance) {
        if (terceirizadoInstance == null) {
            notFound()
            return
        }

        if (terceirizadoInstance.hasErrors()) {
            respond terceirizadoInstance.errors, view:'edit'
            return
        }
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > terceirizadoInstance.emails.size()) {
                int value = listaEmails.size() - terceirizadoInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    terceirizadoInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < terceirizadoInstance.emails.size()) {
                    def value = terceirizadoInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    terceirizadoInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        terceirizadoInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            terceirizadoInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
            if (listaTipoTelefones.size() > terceirizadoInstance.telefones.size()) {
                int value = listaTipoTelefones.size() - terceirizadoInstance.telefones.size()
                for (int i = 0; i < value; i++) {
                    def telefoneInstance = new Telefone()
                    
                    terceirizadoInstance.addToTelefones(telefoneInstance)
                }
            } else {
                if (listaTipoTelefones.size() < terceirizadoInstance.telefones.size()) {
                    def value = terceirizadoInstance.telefones.size() - listaTipoTelefones.size()
                    List<Telefone> telefones = new ArrayList<Telefone>()
                    
                    terceirizadoInstance.telefones.each { telefoneInstance ->
                        telefones.add(telefoneInstance)
                    }
                    def telefonesize = telefones.size()
                    for (int i = 0; i < value; i++) {                           
                        terceirizadoInstance.removeFromTelefones(telefones[telefonesize - 1])
                        telefones[telefonesize - 1].delete(flush: true)
                        telefonesize--
               
                    }
                }
            }
        
        
        contTel = 0
            terceirizadoInstance.telefones.each { telefoneInstance ->
                telefoneInstance.tipo = listaTipoTelefones[contTel]
                telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
                telefoneInstance.telefone = listaTelefoneTelefones[contTel]
                telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
            }
            
        // Código responsável por atualizar o endereço
        
        terceirizadoInstance.endereco.each { enderecoInstance ->
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
      
            if (listadataInicio.size() > terceirizadoInstance.vinculosuse.size()) {
                int value = listadataInicio.size() - terceirizadoInstance.vinculosuse.size()
                for (int i = 0; i < value; i++) {
                    def vinculosuseInstance = new VinculoUSE()         
                    terceirizadoInstance.addToVinculosuse(vinculosuseInstance)
                }
            } else {
                if (listadataInicio.size() < terceirizadoInstance.vinculosuse.size()) {
                    def value = terceirizadoInstance.vinculosuse.size() - listadataInicio.size()
                    List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                    terceirizadoInstance.vinculosuse.each { vinculosuseInstance ->
                        vinculosuse.add(vinculosuseInstance)
                    }
                    def vinculosuseize = vinculosuse.size()
                    for (int i = 0; i < value; i++) {                           
                        terceirizadoInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                        vinculosuse[vinculosuseize - 1].delete(flush: true)
                        vinculosuseize--
               
                    }
                }
            }   

        contvinculo = 0
            terceirizadoInstance.vinculosuse.each { vinculosuseInstance ->
                vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
                vinculosuseInstance.dataTermino = listadataTermino[contvinculo++]
            }
            
        // Código responsável por atualizar os vinculos terceirizado
        def origemget = Origem.get(params.origem.id)
        terceirizadoInstance.vinculoterceirizado.each { vinculoterceirizadoInstance ->
            vinculoterceirizadoInstance.origem = origemget
            vinculoterceirizadoInstance.dataInicio = params.dataIniciovinculoterceirizado
            vinculoterceirizadoInstance.dataFim = params.dataTerminovinculoterceirizado    
        }
            
        terceirizadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Terceirizado.label', default: 'Terceirizado'), terceirizadoInstance.id])
                redirect terceirizadoInstance
            }
            '*'{ respond terceirizadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Terceirizado terceirizadoInstance) {

        if (terceirizadoInstance == null) {
            notFound()
            return
        }

        terceirizadoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Terceirizado.label', default: 'Terceirizado'), terceirizadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'terceirizadoInstance.label', default: 'Terceirizado'), params.id])
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

    def add_vinculouse(Terceirizado TInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'terceirizado';
        render (view:'../add_vinculoUSE', model:[Instance:TInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
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

    def add_email(Terceirizado TInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'terceirizado';
        render (view:'../add_email', model:[Instance:TInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(Terceirizado TInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'terceirizado';
        render (view:'../add_telefone', model:[Instance:TInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
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
