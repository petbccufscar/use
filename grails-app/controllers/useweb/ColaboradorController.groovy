package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ColaboradorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_COLABORADOR_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Colaborador.list(params), model:[colaboradorInstanceCount: Colaborador.count()]
    }
    
    @Secured(['ROLE_COLABORADOR_SHOW'])
    def show(Colaborador colaboradorInstance) {
        respond colaboradorInstance
    }

    @Secured(['ROLE_COLABORADOR_ADD'])
    def create() {
        respond new Colaborador(params)
    }

    @Secured(['ROLE_COLABORADOR_ADD'])
    @Transactional
    def save(Colaborador colaboradorInstance) {
        if (colaboradorInstance == null) {
            notFound()
            return
        }

        if (colaboradorInstance.hasErrors()) {
            respond colaboradorInstance.errors, view:'create'
            return
        }

        colaboradorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'colaboradorInstance.label', default: 'Colaborador'), colaboradorInstance.id])
                redirect colaboradorInstance
            }
            '*' { respond colaboradorInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_COLABORADOR_EDIT'])
    def edit(Colaborador colaboradorInstance) {
        respond colaboradorInstance
    }

    @Secured(['ROLE_COLABORADOR_EDIT'])
    @Transactional
    def update(Colaborador colaboradorInstance) {
        if (colaboradorInstance == null) {
            notFound()
            return
        }

        if (colaboradorInstance.hasErrors()) {
            respond colaboradorInstance.errors, view:'edit'
            return
        }

        colaboradorInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Colaborador.label', default: 'Colaborador'), colaboradorInstance.id])
                redirect colaboradorInstance
            }
            '*'{ respond colaboradorInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_COLABORADOR_DEL'])
    @Transactional
    def delete(Colaborador colaboradorInstance) {

        if (colaboradorInstance == null) {
            notFound()
            return
        }

        colaboradorInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Colaborador.label', default: 'Colaborador'), colaboradorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'colaboradorInstance.label', default: 'Colaborador'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
