package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EnderecoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ENDERECO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Endereco.list(params), model:[enderecoInstanceCount: Endereco.count()]
    }
    
    @Secured(['ROLE_ENDERECO_SHOW'])
    def show(Endereco enderecoInstance) {
        respond enderecoInstance
    }

    @Secured(['ROLE_ENDERECO_ADD'])
    def create() {
        respond new Endereco(params)
    }

    @Secured(['ROLE_ENDERECO_ADD'])
    @Transactional
    def save(Endereco enderecoInstance) {
        if (enderecoInstance == null) {
            notFound()
            return
        }

        if (enderecoInstance.hasErrors()) {
            respond enderecoInstance.errors, view:'create'
            return
        }

        enderecoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'enderecoInstance.label', default: 'Endereco'), enderecoInstance.id])
                redirect enderecoInstance
            }
            '*' { respond enderecoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ENDERECO_EDIT'])
    def edit(Endereco enderecoInstance) {
        respond enderecoInstance
    }

    @Secured(['ROLE_ENDERECO_EDIT'])
    @Transactional
    def update(Endereco enderecoInstance) {
        if (enderecoInstance == null) {
            notFound()
            return
        }

        if (enderecoInstance.hasErrors()) {
            respond enderecoInstance.errors, view:'edit'
            return
        }
       
        enderecoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Endereco.label', default: 'Endereco'), enderecoInstance.id])
                redirect enderecoInstance
            }
            '*'{ respond enderecoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ENDERECO_DEL'])
    @Transactional
    def delete(Endereco enderecoInstance) {

        if (enderecoInstance == null) {
            notFound()
            return
        }

        enderecoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Endereco.label', default: 'Endereco'), enderecoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoInstance.label', default: 'Endereco'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def addressByCEP() {
        
        def endereco = EnderecoConsulta.findByCep(params.cep)
        
        render template: 'endereco', 
        model: [endereco: endereco.getProperties()]
    }
}
