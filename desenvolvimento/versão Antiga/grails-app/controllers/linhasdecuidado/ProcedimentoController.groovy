package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProcedimentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_PROCEDIMENTO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Procedimento.list(params), model:[procedimentoInstanceCount: Procedimento.count()]
    }
    
    @Secured(['ROLE_PROCEDIMENTO_SHOW'])
    def show(Procedimento procedimentoInstance) {
        respond procedimentoInstance
    }

    @Secured(['ROLE_PROCEDIMENTO_ADD'])
    def create() {
        respond new Procedimento(params)
    }

    @Secured(['ROLE_PROCEDIMENTO_ADD'])
    @Transactional
    def save(Procedimento procedimentoInstance) {
        if (procedimentoInstance == null) {
            notFound()
            return
        }

        if (procedimentoInstance.hasErrors()) {
            respond procedimentoInstance.errors, view:'create'
            return
        }

        procedimentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'procedimentoInstance.label', default: 'Procedimento'), procedimentoInstance.id])
                redirect procedimentoInstance
            }
            '*' { respond procedimentoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PROCEDIMENTO_EDIT'])
    def edit(Procedimento procedimentoInstance) {
        respond procedimentoInstance
    }

    @Secured(['ROLE_PROCEDIMENTO_EDIT'])
    @Transactional
    def update(Procedimento procedimentoInstance) {
        if (procedimentoInstance == null) {
            notFound()
            return
        }

        if (procedimentoInstance.hasErrors()) {
            respond procedimentoInstance.errors, view:'edit'
            return
        }

        procedimentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Procedimento.label', default: 'Procedimento'), procedimentoInstance.id])
                redirect procedimentoInstance
            }
            '*'{ respond procedimentoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_PROCEDIMENTO_DEL'])
    @Transactional
    def delete(Procedimento procedimentoInstance) {

        if (procedimentoInstance == null) {
            notFound()
            return
        }

        procedimentoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Procedimento.label', default: 'Procedimento'), procedimentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'procedimentoInstance.label', default: 'Procedimento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
