package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProntuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_PRONTUARIO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Prontuario.list(params), model:[prontuarioInstanceCount: Prontuario.count()]
    }
    
    @Secured(['ROLE_PRONTUARIO_SHOW'])
    def show(Prontuario prontuarioInstance) {
        respond prontuarioInstance
    }

    @Secured(['ROLE_PRONTUARIO_ADD'])
    def create() {
        respond new Prontuario(params)
    }

    @Secured(['ROLE_PRONTUARIO_ADD'])
    @Transactional
    def save(Prontuario prontuarioInstance) {
        if (prontuarioInstance == null) {
            notFound()
            return
        }

        if (prontuarioInstance.hasErrors()) {
            respond prontuarioInstance.errors, view:'create'
            return
        }

        prontuarioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prontuarioInstance.label', default: 'Prontuario'), prontuarioInstance.id])
                redirect prontuarioInstance
            }
            '*' { respond prontuarioInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PRONTUARIO_EDIT'])
    def edit(Prontuario prontuarioInstance) {
        respond prontuarioInstance
    }

    @Secured(['ROLE_PRONTUARIO_EDIT'])
    @Transactional
    def update(Prontuario prontuarioInstance) {
        if (prontuarioInstance == null) {
            notFound()
            return
        }

        if (prontuarioInstance.hasErrors()) {
            respond prontuarioInstance.errors, view:'edit'
            return
        }

        prontuarioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Prontuario.label', default: 'Prontuario'), prontuarioInstance.id])
                redirect prontuarioInstance
            }
            '*'{ respond prontuarioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_PRONTUARIO_DEL'])
    @Transactional
    def delete(Prontuario prontuarioInstance) {

        if (prontuarioInstance == null) {
            notFound()
            return
        }

        prontuarioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Prontuario.label', default: 'Prontuario'), prontuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prontuarioInstance.label', default: 'Prontuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
