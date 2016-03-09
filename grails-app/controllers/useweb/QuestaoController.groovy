package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_QUESTAO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Questao.list(params), model:[questaoInstanceCount: Questao.count()]
    }
    
    @Secured(['ROLE_QUESTAO_SHOW'])
    def show(Questao questaoInstance) {
        respond questaoInstance
    }

    @Secured(['ROLE_QUESTAO_ADD'])
    def create() {
        respond new Questao(params)
    }

    @Secured(['ROLE_QUESTAO_ADD'])
    @Transactional
    def save(Questao questaoInstance) {
        if (questaoInstance == null) {
            notFound()
            return
        }

        if (questaoInstance.hasErrors()) {
            respond questaoInstance.errors, view:'create'
            return
        }

        questaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questaoInstance.label', default: 'Questao'), questaoInstance.id])
                redirect questaoInstance
            }
            '*' { respond questaoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_QUESTAO_EDIT'])
    def edit(Questao questaoInstance) {
        respond questaoInstance
    }

    @Secured(['ROLE_QUESTAO_EDIT'])
    @Transactional
    def update(Questao questaoInstance) {
        if (questaoInstance == null) {
            notFound()
            return
        }

        if (questaoInstance.hasErrors()) {
            respond questaoInstance.errors, view:'edit'
            return
        }

        questaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Questao.label', default: 'Questao'), questaoInstance.id])
                redirect questaoInstance
            }
            '*'{ respond questaoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_QUESTAO_DEL'])
    @Transactional
    def delete(Questao questaoInstance) {

        if (questaoInstance == null) {
            notFound()
            return
        }

        questaoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Questao.label', default: 'Questao'), questaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questaoInstance.label', default: 'Questao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
