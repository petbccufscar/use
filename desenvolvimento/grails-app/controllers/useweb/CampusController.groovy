package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CampusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_CAMPUS_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Campus.list(params), model:[campusInstanceCount: Campus.count()]
    }
    
    @Secured(['ROLE_CAMPUS_SHOW'])
    def show(Campus campusInstance) {
        respond campusInstance
    }

    @Secured(['ROLE_CAMPUS_ADD'])
    def create() {
        respond new Campus(params)
    }

    @Secured(['ROLE_CAMPUS_ADD'])
    @Transactional
    def save(Campus campusInstance) {
        if (campusInstance == null) {
            notFound()
            return
        }

        if (campusInstance.hasErrors()) {
            respond campusInstance.errors, view:'create'
            return
        }

        campusInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'campusInstance.label', default: 'Campus'), campusInstance.id])
                redirect campusInstance
            }
            '*' { respond campusInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_CAMPUS_EDIT'])
    def edit(Campus campusInstance) {
        respond campusInstance
    }

    @Secured(['ROLE_CAMPUS_EDIT'])
    @Transactional
    def update(Campus campusInstance) {
        if (campusInstance == null) {
            notFound()
            return
        }

        if (campusInstance.hasErrors()) {
            respond campusInstance.errors, view:'edit'
            return
        }

        campusInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Campus.label', default: 'Campus'), campusInstance.id])
                redirect campusInstance
            }
            '*'{ respond campusInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_CAMPUS_DEL'])
    @Transactional
    def delete(Campus campusInstance) {

        if (campusInstance == null) {
            notFound()
            return
        }

        campusInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Campus.label', default: 'Campus'), campusInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'campusInstance.label', default: 'Campus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
