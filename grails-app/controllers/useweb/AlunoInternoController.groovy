package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import linhasdecuidado.*

/**
 * AlunoInternoController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class AlunoInternoController {
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
        respond AlunoInterno.list(params), model:[alunoInternoInstanceCount: AlunoInterno.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AlunoInterno.list(params), model:[alunoInternoInstanceCount: AlunoInterno.count()]
    }

    def show(AlunoInterno alunoInternoInstance) {
        respond alunoInternoInstance
    }

    def create() {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        Numdata = 0;
        respond new AlunoInterno(params)
    }

    @Transactional
    def save(AlunoInterno alunoInternoInstance) {
        if (alunoInternoInstance == null) {
            notFound()
            return
        }

        if (alunoInternoInstance.hasErrors()) {
            respond alunoInternoInstance.errors, view:'create'
            return
        }
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                alunoInternoInstance.addToEmails(emailInstance)
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

                alunoInternoInstance.addToTelefones(telefoneInstance)
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
         alunoInternoInstance.addToEndereco(enderecoInstance)
         
        // Código responsavel por criar vinculosuse
        def listadataInicio = params.list('dataInicio')
        def listadataTermino = params.list('dataTermino')
        
            for (int i = 0; i < listadataInicio.size(); i++) {
                def vinculosuseInstance = new VinculoUSE()
                vinculosuseInstance.dataInicio = listadataInicio[i]
                vinculosuseInstance.dataTermino = listadataTermino[i]
                alunoInternoInstance.addToVinculosuse(vinculosuseInstance)
            }
            
        // Código responsável pelo Periodo de Responsabilidade
        
        def PRInstance = new PeriodoDeResponsabilidade(acao: params.acao, 
                                       responsavel: params.responsalve, 
                                       dataDeInicio: params.dataInicioPeriodoDeResponsabilidade, 
                                       dataDeTermino: params.dataTerminoPeriodoDeResponsabilidade)
        
        alunoInternoInstance.addToPeriododeresponsabilidade(PRInstance)
        
        alunoInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'alunoInternoInstance.label', default: 'AlunoInterno'), alunoInternoInstance.id])
                redirect alunoInternoInstance
            }
            '*' { respond alunoInternoInstance, [status: CREATED] }
        }
    }

    def edit(AlunoInterno alunoInternoInstance) {
        counter_vinculouse = 0;
        add_delete_vinculouse = 0;
        counter_email = 0;
        add_delete_email = 0;
        counter_telefone = 0;
        add_delete_telefone = 0;
        AlunoInterno ai;
        ai = AlunoInterno.get(params.id);
        Numdata = ai.vinculosuse.size()-1;
        respond alunoInternoInstance
    }

    @Transactional
    def update(AlunoInterno alunoInternoInstance) {
        if (alunoInternoInstance == null) {
            notFound()
            return
        }

        if (alunoInternoInstance.hasErrors()) {
            respond alunoInternoInstance.errors, view:'edit'
            return
        }
        // Código responsavel por editar e excluir os e-mails     
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > alunoInternoInstance.emails.size()) {
                int value = listaEmails.size() - alunoInternoInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    alunoInternoInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < alunoInternoInstance.emails.size()) {
                    def value = alunoInternoInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    alunoInternoInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        alunoInternoInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            alunoInternoInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
            
        // Código responsavel por editar e excluir os e-mails
        
        int contTel = 0
        
        def listaTipoTelefones = params.list('tipo')
        def listaCodigoAreaTelefones = params.list('codArea')
        def listaTelefoneTelefones = params.list('telefone')
        def listaObservacaoTelefones = params.list('observacao')
            
            if (listaTipoTelefones.size() > alunoInternoInstance.telefones.size()) {
                int value = listaTipoTelefones.size() - alunoInternoInstance.telefones.size()
                for (int i = 0; i < value; i++) {
                    def telefoneInstance = new Telefone()
                    
                    alunoInternoInstance.addToTelefones(telefoneInstance)
                }
            } else {
                if (listaTipoTelefones.size() < alunoInternoInstance.telefones.size()) {
                    def value = alunoInternoInstance.telefones.size() - listaTipoTelefones.size()
                    List<Telefone> telefones = new ArrayList<Telefone>()
                    
                    alunoInternoInstance.telefones.each { telefoneInstance ->
                        telefones.add(telefoneInstance)
                    }
                    def telefonesize = telefones.size()
                    for (int i = 0; i < value; i++) {                           
                        alunoInternoInstance.removeFromTelefones(telefones[telefonesize - 1])
                        telefones[telefonesize - 1].delete(flush: true)
                        telefonesize--
               
                    }
                }
            }
        
        
        contTel = 0
            alunoInternoInstance.telefones.each { telefoneInstance ->
                telefoneInstance.tipo = listaTipoTelefones[contTel]
                telefoneInstance.codigoArea = listaCodigoAreaTelefones[contTel]
                telefoneInstance.telefone = listaTelefoneTelefones[contTel]
                telefoneInstance.observacao = listaObservacaoTelefones[contTel++]
            }
            
        // Código responsável por atualizar o endereço
        
        alunoInternoInstance.endereco.each { enderecoInstance ->
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
      
            if (listadataInicio.size() > alunoInternoInstance.vinculosuse.size()) {
                int value = listadataInicio.size() - alunoInternoInstance.vinculosuse.size()
                for (int i = 0; i < value; i++) {
                    def vinculosuseInstance = new VinculoUSE()         
                    alunoInternoInstance.addToVinculosuse(vinculosuseInstance)
                }
            } else {
                if (listadataInicio.size() < alunoInternoInstance.vinculosuse.size()) {
                    def value = alunoInternoInstance.vinculosuse.size() - listadataInicio.size()
                    List<VinculoUSE> vinculosuse = new ArrayList<VinculoUSE>()
                    
                    alunoInternoInstance.vinculosuse.each { vinculosuseInstance ->
                        vinculosuse.add(vinculosuseInstance)
                    }
                    def vinculosuseize = vinculosuse.size()
                    for (int i = 0; i < value; i++) {                           
                        alunoInternoInstance.removeFromVinculosuse(vinculosuse[vinculosuseize - 1])
                        vinculosuse[vinculosuseize - 1].delete(flush: true)
                        vinculosuseize--
               
                    }
                }
            }   

        contvinculo = 0
            alunoInternoInstance.vinculosuse.each { vinculosuseInstance ->
                vinculosuseInstance.dataInicio = listadataInicio[contvinculo]
                vinculosuseInstance.dataTermino = listadataTermino[contvinculo++]
            }
            
        // Código responsável por atualizar os periodos de responsabilidade
        def Acaoget = Acao.get(params.Acao.id)
        def Responsavelget = Responsavel.get(params.Responsalve.id)
        alunoInternoInstance.periododeresponsabilidade.each { periododeresponsabilidadeInstance ->
            periododeresponsabilidadeInstance.acao = Acaoget
            periododeresponsabilidadeInstance.responsavel = Responsavelget
            periododeresponsabilidadeInstance.dataDeInicio = params.dataInicioPeriodoDeResponsabilidade
            periododeresponsabilidadeInstance.dataDeTermino = params.dataTerminoPeriodoDeResponsabilidade    
        }
        
        alunoInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AlunoInterno.label', default: 'AlunoInterno'), alunoInternoInstance.id])
                redirect alunoInternoInstance
            }
            '*'{ respond alunoInternoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AlunoInterno alunoInternoInstance) {

        if (alunoInternoInstance == null) {
            notFound()
            return
        }

        alunoInternoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AlunoInterno.label', default: 'AlunoInterno'), alunoInternoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'alunoInternoInstance.label', default: 'AlunoInterno'), params.id])
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

    def add_vinculouse(AlunoInterno AIInstance){
        Numdata++
        counter_vinculouse++;
        counter_vinculouse++;
        add_delete_vinculouse = 0;
        String controller = 'alunoInterno';
        render (view:'../add_vinculoUSE', model:[Instance:AIInstance,controller:controller, counter_vinculouse: counter_vinculouse, add_delete_vinculouse: add_delete_vinculouse, Numdata: Numdata])
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

    def add_email(AlunoInterno AIInstance){
        counter_email++;
        counter_email++;
        add_delete_email = 0;
        String controller = 'alunoInterno';
        render (view:'../add_email', model:[Instance:AIInstance,controller:controller, counter_email:counter_email, add_delete_email:add_delete_email])
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

    def add_telefone(AlunoInterno AIInstance){
        counter_telefone++;
        counter_telefone++;
        add_delete_telefone = 0;
        String controller = 'alunoInterno';
        render (view:'../add_telefone', model:[Instance:AIInstance,controller:controller, counter_telefone:counter_telefone, add_delete_telefone: add_delete_telefone])
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
