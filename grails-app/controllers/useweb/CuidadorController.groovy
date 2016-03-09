package useweb


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * CuidadorController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class CuidadorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cuidador.list(params), model:[cuidadorInstanceCount: Cuidador.count()]
    }

	def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Cuidador.list(params), model:[cuidadorInstanceCount: Cuidador.count()]
    }

    def show(Cuidador cuidadorInstance) {
        respond cuidadorInstance
    }

    def create() {
        respond new Cuidador(params)
    }

    @Transactional
    def save(Cuidador cuidadorInstance) {
        if (cuidadorInstance == null) {
            notFound()
            return
        }

        if (cuidadorInstance.hasErrors()) {
            respond cuidadorInstance.errors, view:'create'
            return
        }

        cuidadorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'cuidadorInstance.label', default: 'Cuidador'), cuidadorInstance.id])
                redirect cuidadorInstance
            }
            '*' { respond cuidadorInstance, [status: CREATED] }
        }
    }

    def edit(Cuidador cuidadorInstance) {
        respond cuidadorInstance
    }

    @Transactional
    def update(Cuidador cuidadorInstance) {
        if (cuidadorInstance == null) {
            notFound()
            return
        }

        if (cuidadorInstance.hasErrors()) {
            respond cuidadorInstance.errors, view:'edit'
            return
        }

        cuidadorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Cuidador.label', default: 'Cuidador'), cuidadorInstance.id])
                redirect cuidadorInstance
            }
            '*'{ respond cuidadorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Cuidador cuidadorInstance) {

        if (cuidadorInstance == null) {
            notFound()
            return
        }

        cuidadorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Cuidador.label', default: 'Cuidador'), cuidadorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'cuidadorInstance.label', default: 'Cuidador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
