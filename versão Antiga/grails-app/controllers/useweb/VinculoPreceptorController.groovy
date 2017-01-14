package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoPreceptorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULOPRECEPTOR_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoPreceptor.list(params), model:[vinculoPreceptorInstanceCount: VinculoPreceptor.count()]
    }
    
    @Secured(['ROLE_VINCULOPRECEPTOR_SHOW'])
    def show(VinculoPreceptor vinculoPreceptorInstance) {
        respond vinculoPreceptorInstance
    }

    @Secured(['ROLE_VINCULOPRECEPTOR_ADD'])
    def create() {
        respond new VinculoPreceptor(params)
    }

    @Secured(['ROLE_VINCULOPRECEPTOR_ADD'])
    @Transactional
    def save(VinculoPreceptor vinculoPreceptorInstance) {
        if (vinculoPreceptorInstance == null) {
            notFound()
            return
        }

        if (vinculoPreceptorInstance.hasErrors()) {
            respond vinculoPreceptorInstance.errors, view:'create'
            return
        }

        vinculoPreceptorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoPreceptorInstance.label', default: 'VinculoPreceptor'), vinculoPreceptorInstance.id])
                redirect vinculoPreceptorInstance
            }
            '*' { respond vinculoPreceptorInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULOPRECEPTOR_EDIT'])
    def edit(VinculoPreceptor vinculoPreceptorInstance) {
        respond vinculoPreceptorInstance
    }

    @Secured(['ROLE_VINCULOPRECEPTOR_EDIT'])
    @Transactional
    def update(VinculoPreceptor vinculoPreceptorInstance) {
        if (vinculoPreceptorInstance == null) {
            notFound()
            return
        }

        if (vinculoPreceptorInstance.hasErrors()) {
            respond vinculoPreceptorInstance.errors, view:'edit'
            return
        }

        vinculoPreceptorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoPreceptor.label', default: 'VinculoPreceptor'), vinculoPreceptorInstance.id])
                redirect vinculoPreceptorInstance
            }
            '*'{ respond vinculoPreceptorInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULOPRECEPTOR_DEL'])
    @Transactional
    def delete(VinculoPreceptor vinculoPreceptorInstance) {

        if (vinculoPreceptorInstance == null) {
            notFound()
            return
        }

        vinculoPreceptorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoPreceptor.label', default: 'VinculoPreceptor'), vinculoPreceptorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoPreceptorInstance.label', default: 'VinculoPreceptor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
