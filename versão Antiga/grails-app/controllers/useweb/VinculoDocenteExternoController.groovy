package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoDocenteExternoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULODOCENTEEXTERNO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoDocenteExterno.list(params), model:[vinculoDocenteExternoInstanceCount: VinculoDocenteExterno.count()]
    }
    
    @Secured(['ROLE_VINCULODOCENTEEXTERNO_SHOW'])
    def show(VinculoDocenteExterno vinculoDocenteExternoInstance) {
        respond vinculoDocenteExternoInstance
    }

    @Secured(['ROLE_VINCULODOCENTEEXTERNO_ADD'])
    def create() {
        respond new VinculoDocenteExterno(params)
    }

    @Secured(['ROLE_VINCULODOCENTEEXTERNO_ADD'])
    @Transactional
    def save(VinculoDocenteExterno vinculoDocenteExternoInstance) {
        if (vinculoDocenteExternoInstance == null) {
            notFound()
            return
        }

        if (vinculoDocenteExternoInstance.hasErrors()) {
            respond vinculoDocenteExternoInstance.errors, view:'create'
            return
        }

        vinculoDocenteExternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoDocenteExternoInstance.label', default: 'VinculoDocenteExterno'), vinculoDocenteExternoInstance.id])
                redirect vinculoDocenteExternoInstance
            }
            '*' { respond vinculoDocenteExternoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULODOCENTEEXTERNO_EDIT'])
    def edit(VinculoDocenteExterno vinculoDocenteExternoInstance) {
        respond vinculoDocenteExternoInstance
    }

    @Secured(['ROLE_VINCULODOCENTEEXTERNO_EDIT'])
    @Transactional
    def update(VinculoDocenteExterno vinculoDocenteExternoInstance) {
        if (vinculoDocenteExternoInstance == null) {
            notFound()
            return
        }

        if (vinculoDocenteExternoInstance.hasErrors()) {
            respond vinculoDocenteExternoInstance.errors, view:'edit'
            return
        }

        vinculoDocenteExternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoDocenteExterno.label', default: 'VinculoDocenteExterno'), vinculoDocenteExternoInstance.id])
                redirect vinculoDocenteExternoInstance
            }
            '*'{ respond vinculoDocenteExternoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULODOCENTEEXTERNO_DEL'])
    @Transactional
    def delete(VinculoDocenteExterno vinculoDocenteExternoInstance) {

        if (vinculoDocenteExternoInstance == null) {
            notFound()
            return
        }

        vinculoDocenteExternoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoDocenteExterno.label', default: 'VinculoDocenteExterno'), vinculoDocenteExternoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoDocenteExternoInstance.label', default: 'VinculoDocenteExterno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
