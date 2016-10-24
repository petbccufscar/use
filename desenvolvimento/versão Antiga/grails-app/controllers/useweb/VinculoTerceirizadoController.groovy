package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoTerceirizadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULOTERCEIRIZADO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoTerceirizado.list(params), model:[vinculoTerceirizadoInstanceCount: VinculoTerceirizado.count()]
    }
    
    @Secured(['ROLE_VINCULOTERCEIRIZADO_SHOW'])
    def show(VinculoTerceirizado vinculoTerceirizadoInstance) {
        respond vinculoTerceirizadoInstance
    }

    @Secured(['ROLE_VINCULOTERCEIRIZADO_ADD'])
    def create() {
        respond new VinculoTerceirizado(params)
    }

    @Secured(['ROLE_VINCULOTERCEIRIZADO_ADD'])
    @Transactional
    def save(VinculoTerceirizado vinculoTerceirizadoInstance) {
        if (vinculoTerceirizadoInstance == null) {
            notFound()
            return
        }

        if (vinculoTerceirizadoInstance.hasErrors()) {
            respond vinculoTerceirizadoInstance.errors, view:'create'
            return
        }

        vinculoTerceirizadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoTerceirizadoInstance.label', default: 'VinculoTerceirizado'), vinculoTerceirizadoInstance.id])
                redirect vinculoTerceirizadoInstance
            }
            '*' { respond vinculoTerceirizadoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULOTERCEIRIZADO_EDIT'])
    def edit(VinculoTerceirizado vinculoTerceirizadoInstance) {
        respond vinculoTerceirizadoInstance
    }

    @Secured(['ROLE_VINCULOTERCEIRIZADO_EDIT'])
    @Transactional
    def update(VinculoTerceirizado vinculoTerceirizadoInstance) {
        if (vinculoTerceirizadoInstance == null) {
            notFound()
            return
        }

        if (vinculoTerceirizadoInstance.hasErrors()) {
            respond vinculoTerceirizadoInstance.errors, view:'edit'
            return
        }

        vinculoTerceirizadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoTerceirizado.label', default: 'VinculoTerceirizado'), vinculoTerceirizadoInstance.id])
                redirect vinculoTerceirizadoInstance
            }
            '*'{ respond vinculoTerceirizadoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULOTERCEIRIZADO_DEL'])
    @Transactional
    def delete(VinculoTerceirizado vinculoTerceirizadoInstance) {

        if (vinculoTerceirizadoInstance == null) {
            notFound()
            return
        }

        vinculoTerceirizadoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoTerceirizado.label', default: 'VinculoTerceirizado'), vinculoTerceirizadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoTerceirizadoInstance.label', default: 'VinculoTerceirizado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
