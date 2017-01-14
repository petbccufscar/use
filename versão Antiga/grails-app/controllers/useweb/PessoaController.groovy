package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PessoaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_PESSOA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pessoa.list(params), model:[pessoaInstanceCount: Pessoa.count()]
    }
    
    @Secured(['ROLE_PESSOA_SHOW'])
    def show(Pessoa pessoaInstance) {
        respond pessoaInstance
    }

    @Secured(['ROLE_PESSOA_ADD'])
    def create() {
        respond new Pessoa(params)
    }

    @Secured(['ROLE_PESSOA_ADD'])
    @Transactional
    def save(Pessoa pessoaInstance) {
        if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view:'create'
            return
        }
        
        // Código responsavel por criar e e-mails
        
        def listaEmails = params.list('email')  
            for (int i = 0; i < listaEmails.size(); i++) {
                def emailInstance = new Email()
                emailInstance.email = listaEmails[i]
                pessoaInstance.addToEmails(emailInstance)
            }

        pessoaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pessoaInstance.label', default: 'Pessoa'), pessoaInstance.id])
                redirect pessoaInstance
            }
            '*' { respond pessoaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PESSOA_EDIT'])
    def edit(Pessoa pessoaInstance) {
        respond pessoaInstance
    }

    @Secured(['ROLE_PESSOA_EDIT'])
    @Transactional
    def update(Pessoa pessoaInstance) {
        if (pessoaInstance == null) {
            notFound()
            return
        }

        if (pessoaInstance.hasErrors()) {
            respond pessoaInstance.errors, view:'edit'
            return
        }
        
        // Código responsavel por editar e excluir os e-mails
        
        int cont = 0
        def listaEmails = params.list('email')
            
            if (listaEmails.size() > pessoaInstance.emails.size()) {
                int value = listaEmails.size() - pessoaInstance.emails.size()
                for (int i = 0; i < value; i++) {
                    def emailInstance = new Email()
                    pessoaInstance.addToEmails(emailInstance)
                }
            } else {
                if (listaEmails.size() < pessoaInstance.emails.size()) {
                    def value = pessoaInstance.emails.size() - listaEmails.size()
                    List<Email> emails = new ArrayList<Email>()
                    
                    pessoaInstance.emails.each { emailInstance ->
                        emails.add(emailInstance)
                    }
                    def emailsize = emails.size()
                    for (int i = 0; i < value; i++) {                           
                        pessoaInstance.removeFromEmails(emails[emailsize - 1])
                        emails[emailsize - 1].delete(flush: true)
                        emailsize--
               
                    }
                }
            }
            
            cont = 0
            pessoaInstance.emails.each { emailInstance ->
                emailInstance.email = listaEmails[cont++]
            }
        
        pessoaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect pessoaInstance
            }
            '*'{ respond pessoaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_PESSOA_DEL'])
    @Transactional
    def delete(Pessoa pessoaInstance) {

        if (pessoaInstance == null) {
            notFound()
            return
        }

        pessoaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pessoa.label', default: 'Pessoa'), pessoaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoaInstance.label', default: 'Pessoa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
