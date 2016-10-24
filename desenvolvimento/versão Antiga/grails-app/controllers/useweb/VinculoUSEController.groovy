package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoUSEController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULOUSE_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoUSE.list(params), model:[vinculoUSEInstanceCount: VinculoUSE.count()]
    }
    
    @Secured(['ROLE_VINCULOUSE_SHOW'])
    def show(VinculoUSE vinculoUSEInstance) {
        respond vinculoUSEInstance
    }

    @Secured(['ROLE_VINCULOUSE_ADD'])
    def create() {
        respond new VinculoUSE(params)
    }

    @Secured(['ROLE_VINCULOUSE_ADD'])
    @Transactional
    def save(VinculoUSE vinculoUSEInstance) {
        if (vinculoUSEInstance == null) {
            notFound()
            return
        }

        if (vinculoUSEInstance.hasErrors()) {
            respond vinculoUSEInstance.errors, view:'create'
            return
        }

        vinculoUSEInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoUSEInstance.label', default: 'VinculoUSE'), vinculoUSEInstance.id])
                redirect vinculoUSEInstance
            }
            '*' { respond vinculoUSEInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULOUSE_EDIT'])
    def edit(VinculoUSE vinculoUSEInstance) {
        respond vinculoUSEInstance
    }

    @Secured(['ROLE_VINCULOUSE_EDIT'])
    @Transactional
    def update(VinculoUSE vinculoUSEInstance) {
        if (vinculoUSEInstance == null) {
            notFound()
            return
        }

        if (vinculoUSEInstance.hasErrors()) {
            respond vinculoUSEInstance.errors, view:'edit'
            return
        }

        vinculoUSEInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoUSE.label', default: 'VinculoUSE'), vinculoUSEInstance.id])
                redirect vinculoUSEInstance
            }
            '*'{ respond vinculoUSEInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULOUSE_DEL'])
    @Transactional
    def delete(VinculoUSE vinculoUSEInstance) {

        if (vinculoUSEInstance == null) {
            notFound()
            return
        }

        vinculoUSEInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoUSE.label', default: 'VinculoUSE'), vinculoUSEInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoUSEInstance.label', default: 'VinculoUSE'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
