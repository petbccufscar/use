package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TelefoneController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_TELEFONE_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Telefone.list(params), model:[telefoneInstanceCount: Telefone.count()]
    }
    
    @Secured(['ROLE_TELEFONE_SHOW'])
    def show(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    @Secured(['ROLE_TELEFONE_ADD'])
    def create() {
        respond new Telefone(params)
    }

    @Secured(['ROLE_TELEFONE_ADD'])
    @Transactional
    def save(Telefone telefoneInstance) {
        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'create'
            return
        }
        
        println(params)

        telefoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'telefoneInstance.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*' { respond telefoneInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_TELEFONE_EDIT'])
    def edit(Telefone telefoneInstance) {
        respond telefoneInstance
    }

    @Secured(['ROLE_TELEFONE_EDIT'])
    @Transactional
    def update(Telefone telefoneInstance) {
        if (telefoneInstance == null) {
            notFound()
            return
        }

        if (telefoneInstance.hasErrors()) {
            respond telefoneInstance.errors, view:'edit'
            return
        }

        telefoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect telefoneInstance
            }
            '*'{ respond telefoneInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_TELEFONE_DEL'])
    @Transactional
    def delete(Telefone telefoneInstance) {

        if (telefoneInstance == null) {
            notFound()
            return
        }

        telefoneInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Telefone.label', default: 'Telefone'), telefoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefoneInstance.label', default: 'Telefone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
