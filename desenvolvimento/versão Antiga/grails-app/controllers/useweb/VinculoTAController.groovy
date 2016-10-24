package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VinculoTAController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_VINCULOTA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VinculoTA.list(params), model:[vinculoTAInstanceCount: VinculoTA.count()]
    }
    
    @Secured(['ROLE_VINCULOTA_SHOW'])
    def show(VinculoTA vinculoTAInstance) {
        respond vinculoTAInstance
    }

    @Secured(['ROLE_VINCULOTA_ADD'])
    def create() {
        respond new VinculoTA(params)
    }

    @Secured(['ROLE_VINCULOTA_ADD'])
    @Transactional
    def save(VinculoTA vinculoTAInstance) {
        if (vinculoTAInstance == null) {
            notFound()
            return
        }

        if (vinculoTAInstance.hasErrors()) {
            respond vinculoTAInstance.errors, view:'create'
            return
        }

        vinculoTAInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vinculoTAInstance.label', default: 'VinculoTA'), vinculoTAInstance.id])
                redirect vinculoTAInstance
            }
            '*' { respond vinculoTAInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_VINCULOTA_EDIT'])
    def edit(VinculoTA vinculoTAInstance) {
        respond vinculoTAInstance
    }

    @Secured(['ROLE_VINCULOTA_EDIT'])
    @Transactional
    def update(VinculoTA vinculoTAInstance) {
        if (vinculoTAInstance == null) {
            notFound()
            return
        }

        if (vinculoTAInstance.hasErrors()) {
            respond vinculoTAInstance.errors, view:'edit'
            return
        }

        vinculoTAInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VinculoTA.label', default: 'VinculoTA'), vinculoTAInstance.id])
                redirect vinculoTAInstance
            }
            '*'{ respond vinculoTAInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_VINCULOTA_DEL'])
    @Transactional
    def delete(VinculoTA vinculoTAInstance) {

        if (vinculoTAInstance == null) {
            notFound()
            return
        }

        vinculoTAInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VinculoTA.label', default: 'VinculoTA'), vinculoTAInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vinculoTAInstance.label', default: 'VinculoTA'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
