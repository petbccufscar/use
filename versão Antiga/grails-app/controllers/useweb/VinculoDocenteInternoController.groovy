package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoDocenteInternoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULODOCENTEINTERNO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoDocenteInterno.list(params), model:[vinculoDocenteInternoInstanceCount: VinculoDocenteInterno.count()]
    }
    
    @Secured(['ROLE_VINCULODOCENTEINTERNO_SHOW'])
    def show(VinculoDocenteInterno vinculoDocenteInternoInstance) {
        respond vinculoDocenteInternoInstance
    }

    @Secured(['ROLE_VINCULODOCENTEINTERNO_ADD'])
    def create() {
        respond new VinculoDocenteInterno(params)
    }

    @Secured(['ROLE_VINCULODOCENTEINTERNO_ADD'])
    @Transactional
    def save(VinculoDocenteInterno vinculoDocenteInternoInstance) {
        if (vinculoDocenteInternoInstance == null) {
            notFound()
            return
        }

        if (vinculoDocenteInternoInstance.hasErrors()) {
            respond vinculoDocenteInternoInstance.errors, view:'create'
            return
        }

        vinculoDocenteInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoDocenteInternoInstance.label', default: 'VinculoDocenteInterno'), vinculoDocenteInternoInstance.id])
                redirect vinculoDocenteInternoInstance
            }
            '*' { respond vinculoDocenteInternoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULODOCENTEINTERNO_EDIT'])
    def edit(VinculoDocenteInterno vinculoDocenteInternoInstance) {
        respond vinculoDocenteInternoInstance
    }

    @Secured(['ROLE_VINCULODOCENTEINTERNO_EDIT'])
    @Transactional
    def update(VinculoDocenteInterno vinculoDocenteInternoInstance) {
        if (vinculoDocenteInternoInstance == null) {
            notFound()
            return
        }

        if (vinculoDocenteInternoInstance.hasErrors()) {
            respond vinculoDocenteInternoInstance.errors, view:'edit'
            return
        }

        vinculoDocenteInternoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoDocenteInterno.label', default: 'VinculoDocenteInterno'), vinculoDocenteInternoInstance.id])
                redirect vinculoDocenteInternoInstance
            }
            '*'{ respond vinculoDocenteInternoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULODOCENTEINTERNO_DEL'])
    @Transactional
    def delete(VinculoDocenteInterno vinculoDocenteInternoInstance) {

        if (vinculoDocenteInternoInstance == null) {
            notFound()
            return
        }

        vinculoDocenteInternoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoDocenteInterno.label', default: 'VinculoDocenteInterno'), vinculoDocenteInternoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoDocenteInternoInstance.label', default: 'VinculoDocenteInterno'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
