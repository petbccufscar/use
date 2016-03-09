package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubAreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_SUBAREA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SubArea.list(params), model:[subAreaInstanceCount: SubArea.count()]
    }
    
    @Secured(['ROLE_SUBAREA_SHOW'])
    def show(SubArea subAreaInstance) {
        respond subAreaInstance
    }

    @Secured(['ROLE_SUBAREA_ADD'])
    def create() {
        respond new SubArea(params)
    }

    @Secured(['ROLE_SUBAREA_ADD'])
    @Transactional
    def save(SubArea subAreaInstance) {
        if (subAreaInstance == null) {
            notFound()
            return
        }

        if (subAreaInstance.hasErrors()) {
            respond subAreaInstance.errors, view:'create'
            return
        }

        subAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subAreaInstance.label', default: 'SubArea'), subAreaInstance.id])
                redirect subAreaInstance
            }
            '*' { respond subAreaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_SUBAREA_EDIT'])
    def edit(SubArea subAreaInstance) {
        respond subAreaInstance
    }

    @Secured(['ROLE_SUBAREA_EDIT'])
    @Transactional
    def update(SubArea subAreaInstance) {
        if (subAreaInstance == null) {
            notFound()
            return
        }

        if (subAreaInstance.hasErrors()) {
            respond subAreaInstance.errors, view:'edit'
            return
        }

        subAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SubArea.label', default: 'SubArea'), subAreaInstance.id])
                redirect subAreaInstance
            }
            '*'{ respond subAreaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_SUBAREA_DEL'])
    @Transactional
    def delete(SubArea subAreaInstance) {

        if (subAreaInstance == null) {
            notFound()
            return
        }

        subAreaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SubArea.label', default: 'SubArea'), subAreaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subAreaInstance.label', default: 'SubArea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
