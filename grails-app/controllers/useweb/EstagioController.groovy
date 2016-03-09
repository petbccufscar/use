package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstagioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ESTAGIO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Estagio.list(params), model:[estagioInstanceCount: Estagio.count()]
    }
    
    @Secured(['ROLE_ESTAGIO_SHOW'])
    def show(Estagio estagioInstance) {
        respond estagioInstance
    }

    @Secured(['ROLE_ESTAGIO_ADD'])
    def create() {
        respond new Estagio(params)
    }

    @Secured(['ROLE_ESTAGIO_ADD'])
    @Transactional
    def save(Estagio estagioInstance) {
        if (estagioInstance == null) {
            notFound()
            return
        }

        if (estagioInstance.hasErrors()) {
            respond estagioInstance.errors, view:'create'
            return
        }

        estagioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estagioInstance.label', default: 'Estagio'), estagioInstance.id])
                redirect estagioInstance
            }
            '*' { respond estagioInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ESTAGIO_EDIT'])
    def edit(Estagio estagioInstance) {
        respond estagioInstance
    }

    @Secured(['ROLE_ESTAGIO_EDIT'])
    @Transactional
    def update(Estagio estagioInstance) {
        if (estagioInstance == null) {
            notFound()
            return
        }

        if (estagioInstance.hasErrors()) {
            respond estagioInstance.errors, view:'edit'
            return
        }

        estagioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Estagio.label', default: 'Estagio'), estagioInstance.id])
                redirect estagioInstance
            }
            '*'{ respond estagioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ESTAGIO_DEL'])
    @Transactional
    def delete(Estagio estagioInstance) {

        if (estagioInstance == null) {
            notFound()
            return
        }

        estagioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Estagio.label', default: 'Estagio'), estagioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estagioInstance.label', default: 'Estagio'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
