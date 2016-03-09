package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EnderecoConsultaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_ENDERECOCONSULTA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EnderecoConsulta.list(params), model:[enderecoConsultaInstanceCount: EnderecoConsulta.count()]
    }
    
    @Secured(['ROLE_ENDERECOCONSULTA_SHOW'])
    def show(EnderecoConsulta enderecoConsultaInstance) {
        respond enderecoConsultaInstance
    }

    @Secured(['ROLE_ENDERECOCONSULTA_ADD'])
    def create() {
        respond new EnderecoConsulta(params)
    }

    @Secured(['ROLE_ENDERECOCONSULTA_ADD'])
    @Transactional
    def save(EnderecoConsulta enderecoConsultaInstance) {
        if (enderecoConsultaInstance == null) {
            notFound()
            return
        }

        if (enderecoConsultaInstance.hasErrors()) {
            respond enderecoConsultaInstance.errors, view:'create'
            return
        }

        enderecoConsultaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'enderecoConsultaInstance.label', default: 'EnderecoConsulta'), enderecoConsultaInstance.id])
                redirect enderecoConsultaInstance
            }
            '*' { respond enderecoConsultaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ENDERECOCONSULTA_EDIT'])
    def edit(EnderecoConsulta enderecoConsultaInstance) {
        respond enderecoConsultaInstance
    }

    @Secured(['ROLE_ENDERECOCONSULTA_EDIT'])
    @Transactional
    def update(EnderecoConsulta enderecoConsultaInstance) {
        if (enderecoConsultaInstance == null) {
            notFound()
            return
        }

        if (enderecoConsultaInstance.hasErrors()) {
            respond enderecoConsultaInstance.errors, view:'edit'
            return
        }

        enderecoConsultaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EnderecoConsulta.label', default: 'EnderecoConsulta'), enderecoConsultaInstance.id])
                redirect enderecoConsultaInstance
            }
            '*'{ respond enderecoConsultaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ENDERECOCONSULTA_DEL'])
    @Transactional
    def delete(EnderecoConsulta enderecoConsultaInstance) {

        if (enderecoConsultaInstance == null) {
            notFound()
            return
        }

        enderecoConsultaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EnderecoConsulta.label', default: 'EnderecoConsulta'), enderecoConsultaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'enderecoConsultaInstance.label', default: 'EnderecoConsulta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
