package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AtendimentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ATENDIMENTO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Atendimento.list(params), model:[atendimentoInstanceCount: Atendimento.count()]
    }
    
    @Secured(['ROLE_ATENDIMENTO_SHOW'])
    def show(Atendimento atendimentoInstance) {
        respond atendimentoInstance
    }

    @Secured(['ROLE_ATENDIMENTO_ADD'])
    def create() {
        respond new Atendimento(params)
    }

    @Secured(['ROLE_ATENDIMENTO_ADD'])
    @Transactional
    def save(Atendimento atendimentoInstance) {
        if (atendimentoInstance == null) {
            notFound()
            return
        }

        if (atendimentoInstance.hasErrors()) {
            respond atendimentoInstance.errors, view:'create'
            return
        }

        atendimentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'atendimentoInstance.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect atendimentoInstance
            }
            '*' { respond atendimentoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ATENDIMENTO_EDIT'])
    def edit(Atendimento atendimentoInstance) {
        respond atendimentoInstance
    }

    @Secured(['ROLE_ATENDIMENTO_EDIT'])
    @Transactional
    def update(Atendimento atendimentoInstance) {
        if (atendimentoInstance == null) {
            notFound()
            return
        }

        if (atendimentoInstance.hasErrors()) {
            respond atendimentoInstance.errors, view:'edit'
            return
        }

        atendimentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Atendimento.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect atendimentoInstance
            }
            '*'{ respond atendimentoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ATENDIMENTO_DEL'])
    @Transactional
    def delete(Atendimento atendimentoInstance) {

        if (atendimentoInstance == null) {
            notFound()
            return
        }

        atendimentoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Atendimento.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'atendimentoInstance.label', default: 'Atendimento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
