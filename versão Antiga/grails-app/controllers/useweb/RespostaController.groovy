package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RespostaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_RESPOSTA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Resposta.list(params), model:[respostaInstanceCount: Resposta.count()]
    }
    
    @Secured(['ROLE_RESPOSTA_SHOW'])
    def show(Resposta respostaInstance) {
        respond respostaInstance
    }

    @Secured(['ROLE_RESPOSTA_ADD'])
    def create() {
        respond new Resposta(params)
    }

    @Secured(['ROLE_RESPOSTA_ADD'])
    @Transactional
    def save(Resposta respostaInstance) {
        if (respostaInstance == null) {
            notFound()
            return
        }

        if (respostaInstance.hasErrors()) {
            respond respostaInstance.errors, view:'create'
            return
        }

        respostaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'respostaInstance.label', default: 'Resposta'), respostaInstance.id])
                redirect respostaInstance
            }
            '*' { respond respostaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_RESPOSTA_EDIT'])
    def edit(Resposta respostaInstance) {
        respond respostaInstance
    }

    @Secured(['ROLE_RESPOSTA_EDIT'])
    @Transactional
    def update(Resposta respostaInstance) {
        if (respostaInstance == null) {
            notFound()
            return
        }

        if (respostaInstance.hasErrors()) {
            respond respostaInstance.errors, view:'edit'
            return
        }

        respostaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Resposta.label', default: 'Resposta'), respostaInstance.id])
                redirect respostaInstance
            }
            '*'{ respond respostaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_RESPOSTA_DEL'])
    @Transactional
    def delete(Resposta respostaInstance) {

        if (respostaInstance == null) {
            notFound()
            return
        }

        respostaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Resposta.label', default: 'Resposta'), respostaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'respostaInstance.label', default: 'Resposta'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
