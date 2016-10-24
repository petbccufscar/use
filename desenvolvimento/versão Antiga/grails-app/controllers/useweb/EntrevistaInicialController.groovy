package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EntrevistaInicialController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ENTREVISTAINICIAL_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EntrevistaInicial.list(params), model:[entrevistaInicialInstanceCount: EntrevistaInicial.count()]
    }
    
    @Secured(['ROLE_ENTREVISTAINICIAL_SHOW'])
    def show(EntrevistaInicial entrevistaInicialInstance) {
        respond entrevistaInicialInstance
    }

    @Secured(['ROLE_ENTREVISTAINICIAL_ADD'])
    def create() {
        respond new EntrevistaInicial(params)
    }

    @Secured(['ROLE_ENTREVISTAINICIAL_ADD'])
    @Transactional
    def save(EntrevistaInicial entrevistaInicialInstance) {
        if (entrevistaInicialInstance == null) {
            notFound()
            return
        }

        if (entrevistaInicialInstance.hasErrors()) {
            respond entrevistaInicialInstance.errors, view:'create'
            return
        }

        entrevistaInicialInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'entrevistaInicialInstance.label', default: 'EntrevistaInicial'), entrevistaInicialInstance.id])
                redirect entrevistaInicialInstance
            }
            '*' { respond entrevistaInicialInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ENTREVISTAINICIAL_EDIT'])
    def edit(EntrevistaInicial entrevistaInicialInstance) {
        respond entrevistaInicialInstance
    }

    @Secured(['ROLE_ENTREVISTAINICIAL_EDIT'])
    @Transactional
    def update(EntrevistaInicial entrevistaInicialInstance) {
        if (entrevistaInicialInstance == null) {
            notFound()
            return
        }

        if (entrevistaInicialInstance.hasErrors()) {
            respond entrevistaInicialInstance.errors, view:'edit'
            return
        }

        entrevistaInicialInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EntrevistaInicial.label', default: 'EntrevistaInicial'), entrevistaInicialInstance.id])
                redirect entrevistaInicialInstance
            }
            '*'{ respond entrevistaInicialInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ENTREVISTAINICIAL_DEL'])
    @Transactional
    def delete(EntrevistaInicial entrevistaInicialInstance) {

        if (entrevistaInicialInstance == null) {
            notFound()
            return
        }

        entrevistaInicialInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EntrevistaInicial.label', default: 'EntrevistaInicial'), entrevistaInicialInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrevistaInicialInstance.label', default: 'EntrevistaInicial'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
