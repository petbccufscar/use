package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_DOCENTE_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Docente.list(params), model:[docenteInstanceCount: Docente.count()]
    }
    
    @Secured(['ROLE_DOCENTE_SHOW'])
    def show(Docente docenteInstance) {
        respond docenteInstance
    }

    @Secured(['ROLE_DOCENTE_ADD'])
    def create() {
        respond new Docente(params)
    }

    @Secured(['ROLE_DOCENTE_ADD'])
    @Transactional
    def save(Docente docenteInstance) {
        if (docenteInstance == null) {
            notFound()
            return
        }

        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view:'create'
            return
        }

        docenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'docenteInstance.label', default: 'Docente'), docenteInstance.id])
                redirect docenteInstance
            }
            '*' { respond docenteInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_DOCENTE_EDIT'])
    def edit(Docente docenteInstance) {
        respond docenteInstance
    }

    @Secured(['ROLE_DOCENTE_EDIT'])
    @Transactional
    def update(Docente docenteInstance) {
        if (docenteInstance == null) {
            notFound()
            return
        }

        if (docenteInstance.hasErrors()) {
            respond docenteInstance.errors, view:'edit'
            return
        }

        docenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Docente.label', default: 'Docente'), docenteInstance.id])
                redirect docenteInstance
            }
            '*'{ respond docenteInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_DOCENTE_DEL'])
    @Transactional
    def delete(Docente docenteInstance) {

        if (docenteInstance == null) {
            notFound()
            return
        }

        docenteInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Docente.label', default: 'Docente'), docenteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'docenteInstance.label', default: 'Docente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
