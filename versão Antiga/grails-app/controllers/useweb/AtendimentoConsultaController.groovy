package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AtendimentoConsultaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ATENDIMENTOCONSULTA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AtendimentoConsulta.list(params), model:[atendimentoConsultaInstanceCount: AtendimentoConsulta.count()]
    }
    
    @Secured(['ROLE_ATENDIMENTOCONSULTA_SHOW'])
    def show(AtendimentoConsulta atendimentoConsultaInstance) {
        respond atendimentoConsultaInstance
    }

    @Secured(['ROLE_ATENDIMENTOCONSULTA_ADD'])
    def create() {
        respond new AtendimentoConsulta(params)
    }

    @Secured(['ROLE_ATENDIMENTOCONSULTA_ADD'])
    @Transactional
    def save(AtendimentoConsulta atendimentoConsultaInstance) {
        if (atendimentoConsultaInstance == null) {
            notFound()
            return
        }

        if (atendimentoConsultaInstance.hasErrors()) {
            respond atendimentoConsultaInstance.errors, view:'create'
            return
        }

        atendimentoConsultaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'atendimentoConsultaInstance.label', default: 'AtendimentoConsulta'), atendimentoConsultaInstance.id])
                redirect atendimentoConsultaInstance
            }
            '*' { respond atendimentoConsultaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ATENDIMENTOCONSULTA_EDIT'])
    def edit(AtendimentoConsulta atendimentoConsultaInstance) {
        respond atendimentoConsultaInstance
    }

    @Secured(['ROLE_ATENDIMENTOCONSULTA_EDIT'])
    @Transactional
    def update(AtendimentoConsulta atendimentoConsultaInstance) {
        if (atendimentoConsultaInstance == null) {
            notFound()
            return
        }

        if (atendimentoConsultaInstance.hasErrors()) {
            respond atendimentoConsultaInstance.errors, view:'edit'
            return
        }

        atendimentoConsultaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AtendimentoConsulta.label', default: 'AtendimentoConsulta'), atendimentoConsultaInstance.id])
                redirect atendimentoConsultaInstance
            }
            '*'{ respond atendimentoConsultaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ATENDIMENTOCONSULTA_DEL'])
    @Transactional
    def delete(AtendimentoConsulta atendimentoConsultaInstance) {

        if (atendimentoConsultaInstance == null) {
            notFound()
            return
        }

        atendimentoConsultaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AtendimentoConsulta.label', default: 'AtendimentoConsulta'), atendimentoConsultaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'atendimentoConsultaInstance.label', default: 'AtendimentoConsulta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
