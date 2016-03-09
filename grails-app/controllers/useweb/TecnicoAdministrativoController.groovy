package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TecnicoAdministrativoController {
    int counter_vinculouse = 0;
    int add_delete_vinculouse = 0;
    int counter_email = 0;
    int add_delete_email = 0;
    int counter_telefone = 0;
    int add_delete_telefone = 0;
    int Numdata = 0;
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_TECNICOADMINISTRATIVO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TecnicoAdministrativo.list(params), model:[tecnicoAdministrativoInstanceCount: TecnicoAdministrativo.count()]
    }
    
    @Secured(['ROLE_TECNICOADMINISTRATIVO_SHOW'])
    def show(TecnicoAdministrativo tecnicoAdministrativoInstance) {
        respond tecnicoAdministrativoInstance
    }

    @Secured(['ROLE_TECNICOADMINISTRATIVO_ADD'])
    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new TecnicoAdministrativo(params)
    }

    @Secured(['ROLE_TECNICOADMINISTRATIVO_ADD'])
    @Transactional
    def save(TecnicoAdministrativo tecnicoAdministrativoInstance) {

        if (tecnicoAdministrativoInstance == null) {
            notFound()
            return
        }

        if (tecnicoAdministrativoInstance.hasErrors()) {
            respond tecnicoAdministrativoInstance.errors, view:'create'
            return
        }
        // Código responsavel por criar e e-mails
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                tecnicoAdministrativoInstance.addToEmails(emailInstance)
            }
            
         // Código responsavel por criar telefones
        def tipoTelefones = params.list('tipo')
        def codigoAreaTelefones = params.list('codigoArea')
        def telefoneTelefones = params.list('telefone')
        def observacaoTelefones = params.list('observacao')
        
            for (int j = 0; j < tipoTelefones.size(); j++) {
                def telefoneInstance = new Telefone()
                
                telefoneInstance.tipo = tipoTelefones[j]
                telefoneInstance.codigoArea = codigoAreaTelefones[j]
                telefoneInstance.telefone = telefoneTelefones[j]
                telefoneInstance.observacao = observacaoTelefones[j]

                tecnicoAdministrativoInstance.addToTelefones(telefoneInstance)
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
        
        tecnicoAdministrativoInstance.addToEndereco(enderecoInstance)
        
        // Código responsavel por criar vinculosuse

        def listadataInicio = []
        def listadataTermino = []
        int n = 0;
        println(Numdata)
        println(params)
        for (int i = 0; i < Numdata+1 ; i++){
            if (params.("dataInicio_" + i) != null){
            listadataInicio[n] = params.("dataInicio_" + i)
            listadataTermino[n] = params.("dataTermino_" + i)
            n++
            }
        }
        println(listadataInicio)

            for (int i = 0; i < listadataInicio.size(); i++) {
                def vinculosuseInstance = new VinculoUSE()
                vinculosuseInstance.dataInicio = listadataInicio[i]
                vinculosuseInstance.dataTermino = listadataTermino[i]
                tecnicoAdministrativoInstance.addToVinculosuse(vinculosuseInstance)
            }
            
        // Código responsável pelo vinculo T.A.
        
        def vinculotaInstance = new VinculoTA(departamento: params.departamento, 
                                            dataInicio: params.dataIniciovinculota, 
                                            dataTermino: params.dataTerminovinculota)
        
        tecnicoAdministrativoInstance.addToVinculota(vinculotaInstance)
            
        
        tecnicoAdministrativoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tecnicoAdministrativoInstance.label', default: 'TecnicoAdministrativo'), tecnicoAdministrativoInstance.id])
                redirect tecnicoAdministrativoInstance
            }
            '*' { respond tecnicoAdministrativoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_TECNICOADMINISTRATIVO_EDIT'])
    def edit(TecnicoAdministrativo tecnicoAdministrativoInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        TecnicoAdministrativo ta;
        ta = TecnicoAdministrativo.get(params.id);
        Numdata = ta.vinculosuse.size()-1;
        respond tecnicoAdministrativoInstance
    }

    @Secured(['ROLE_TECNICOADMINISTRATIVO_EDIT'])
    @Transactional
    def update(TecnicoAdministrativo tecnicoAdministrativoInstance) {
        if (tecnicoAdministrativoInstance == null) {
            notFound()
            return
        }

        if (tecnicoAdministrativoInstance.hasErrors()) {
            respond tecnicoAdministrativoInstance.errors, view:'edit'
            return
        }
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > tecnicoAdministrativoInstance.emails.size()) {
                int value = listaEmails.size() - tecnicoAdministrativoInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    tecnicoAdministrativoInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < tecnicoAdministrativoInstance.emails.size()) {
                    def value = tecnicoAdministrativoInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    tecnicoAdministrativoInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        tecnicoAdministrativoInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            tecnicoAdministrativoInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
            
        // Código responsavel por editar e excluir os telefones
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codigoArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
            if (listaTipoTelefones.size() > tecnicoAdministrativoInstance.telefones.size()) {
                int value = listaTipoTelefones.size() - tecnicoAdministrativoInstance.telefones.size()
                for (int i = 0; i < value; i++) {
                    def telefoneInstance = new Telefone()
                    
                    tecnicoAdministrativoInstance.addToTelefones(telefoneInstance)
                }
            } else {
                if (listaTipoTelefones.size() < tecnicoAdministrativoInstance.telefones.size()) {
                    def value = tecnicoAdministrativoInstance.telefones.size() - listaTipoTelefones.size()
                    List<Telefone> telefones = new ArrayList<Telefone>()
                    
                    tecnicoAdministrativoInstance.telefones.each { telefoneInstance ->
                        telefones.add(telefoneInstance)
                    }
                    def telefonesize = telefones.size()
                    for (int i = 0; i < value; i++) {                           
                        tecnicoAdministrativoInstance.removeFromTelefones(telefones[telefonesize - 1])
                        telefones[telefonesize - 1].delete(flush: true)
                        telefonesize--
               
                    }
                }
            }

        contTel = 0
            tecnicoAdministrativoInstance.telefones.each { telefoneInstance ->
                telefoneInstance.tipo = listaTipoTelefones[contTel]
                telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
                telefoneInstance.telefone = listaTelefoneTelefones[contTel]
                telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
            }
            
        // Código responsável por atualizar o endereço
        
        tecnicoAdministrativoInstance.endereco.each { enderecoInstance ->
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
      
            if (listadataInicio.size() > tecnicoAdministrativoInstance.vinculosuse.size()) {
                int value = listadataInicio.size() - tecnicoAdministrativoInstance.vinculosuse.size()
                for (int i = 0; i < value; i++) {
                    def vinculosuseInstance = new VinculoUSE()         
                    tecnicoAdministrativoInstance.addToVinculosuse(vinculosuseInstance)
                }
            } else {
                if (listadataInicio.size() < tecnicoAdministrativoInstance.vinculosuse.size()) {
                    def value = tecnicoAdministrativoInstance.vinculosuse.size() - listadataInicio.size()
                    List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                    tecnicoAdministrativoInstance.vinculosuse.each { vinculosuseInstance ->
                        vinculosuse.add(vinculosuseInstance)
                    }
                    def vinculosuseize = vinculosuse.size()
                    for (int i = 0; i < value; i++) {                           
                        tecnicoAdministrativoInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                        vinculosuse[vinculosuseize - 1].delete(flush: true)
                        vinculosuseize--
               
                    }
                }
            }   

        contvinculo = 0
            tecnicoAdministrativoInstance.vinculosuse.each { vinculosuseInstance ->
                vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
                vinculosuseInstance.dataTermino = listadataTermino[contvinculo++]
            }
        
        // Código responsável por atualizar os vinculos T.A.
        def departamentoget = Departamento.get(params.departamento.id)
        tecnicoAdministrativoInstance.vinculota.each { vinculotaInstance ->
            vinculotaInstance.departamento = departamentoget
            vinculotaInstance.dataInicio = params.dataIniciovinculota
            vinculotaInstance.dataTermino = params.dataTerminovinculota    
        }
        
        
        tecnicoAdministrativoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TecnicoAdministrativo.label', default: 'TecnicoAdministrativo'), tecnicoAdministrativoInstance.id])
                redirect tecnicoAdministrativoInstance
            }
            '*'{ respond tecnicoAdministrativoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_TECNICOADMINISTRATIVO_DEL'])
    @Transactional
    def delete(TecnicoAdministrativo tecnicoAdministrativoInstance) {

        if (tecnicoAdministrativoInstance == null) {
            notFound()
            return
        }

        tecnicoAdministrativoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TecnicoAdministrativo.label', default: 'TecnicoAdministrativo'), tecnicoAdministrativoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tecnicoAdministrativoInstance.label', default: 'TecnicoAdministrativo'), params.id])
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
    
    def add_vinculouse(TecnicoAdministrativo TAInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'tecnicoAdministrativo';
        render (view:'../add_vinculoUSE', model:[Instance:TAInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
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

    def add_email(TecnicoAdministrativo TAInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'tecnicoAdministrativo';
        render (view:'../add_email', model:[Instance:TAInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(TecnicoAdministrativo TAInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'tecnicoAdministrativo';
        render (view:'../add_telefone', model:[Instance:TAInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
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

