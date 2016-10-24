package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrigemController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ORIGEM_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Origem.list(params), model:[origemInstanceCount: Origem.count()]
    }
    
    @Secured(['ROLE_ORIGEM_SHOW'])
    def show(Origem origemInstance) {
        respond origemInstance
    }

    @Secured(['ROLE_ORIGEM_ADD'])
    def create() {
        respond new Origem(params)
    }

    @Secured(['ROLE_ORIGEM_ADD'])
    @Transactional
    def save(Origem origemInstance) {
        if (origemInstance == null) {
            notFound()
            return
        }

        if (origemInstance.hasErrors()) {
            respond origemInstance.errors, view:'create'
            return
        }

        origemInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'origemInstance.label', default: 'Origem'), origemInstance.id])
                redirect origemInstance
            }
            '*' { respond origemInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ORIGEM_EDIT'])
    def edit(Origem origemInstance) {
        respond origemInstance
    }

    @Secured(['ROLE_ORIGEM_EDIT'])
    @Transactional
    def update(Origem origemInstance) {
        if (origemInstance == null) {
            notFound()
            return
        }

        if (origemInstance.hasErrors()) {
            respond origemInstance.errors, view:'edit'
            return
        }

        origemInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Origem.label', default: 'Origem'), origemInstance.id])
                redirect origemInstance
            }
            '*'{ respond origemInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ORIGEM_DEL'])
    @Transactional
    def delete(Origem origemInstance) {

        if (origemInstance == null) {
            notFound()
            return
        }

        origemInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Origem.label', default: 'Origem'), origemInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'origemInstance.label', default: 'Origem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
