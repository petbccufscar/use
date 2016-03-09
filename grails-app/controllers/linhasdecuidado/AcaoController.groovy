package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AcaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ACAO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Acao.list(params), model:[acaoInstanceCount: Acao.count()]
    }
    
    @Secured(['ROLE_ACAO_SHOW'])
    def show(Acao acaoInstance) {
        respond acaoInstance
    }

    @Secured(['ROLE_ACAO_ADD'])
    def create() {
        respond new Acao(params)
    }

    @Secured(['ROLE_ACAO_ADD'])
    @Transactional
    def save(Acao acaoInstance) {
        if (acaoInstance == null) {
            notFound()
            return
        }

        if (acaoInstance.hasErrors()) {
            respond acaoInstance.errors, view:'create'
            return
        }

        acaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'acaoInstance.label', default: 'Acao'), acaoInstance.id])
                redirect acaoInstance
            }
            '*' { respond acaoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ACAO_EDIT'])
    def edit(Acao acaoInstance) {
        respond acaoInstance
    }

    @Secured(['ROLE_ACAO_EDIT'])
    @Transactional
    def update(Acao acaoInstance) {
        if (acaoInstance == null) {
            notFound()
            return
        }

        if (acaoInstance.hasErrors()) {
            respond acaoInstance.errors, view:'edit'
            return
        }

        acaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Acao.label', default: 'Acao'), acaoInstance.id])
                redirect acaoInstance
            }
            '*'{ respond acaoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ACAO_DEL'])
    @Transactional
    def delete(Acao acaoInstance) {

        if (acaoInstance == null) {
            notFound()
            return
        }

        acaoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Acao.label', default: 'Acao'), acaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'acaoInstance.label', default: 'Acao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
