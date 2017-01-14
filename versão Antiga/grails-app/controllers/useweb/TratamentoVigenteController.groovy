package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TratamentoVigenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_TRATAMENTOVIGENTE_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TratamentoVigente.list(params), model:[tratamentoVigenteInstanceCount: TratamentoVigente.count()]
    }
    
    @Secured(['ROLE_TRATAMENTOVIGENTE_SHOW'])
    def show(TratamentoVigente tratamentoVigenteInstance) {
        respond tratamentoVigenteInstance
    }

    @Secured(['ROLE_TRATAMENTOVIGENTE_ADD'])
    def create() {
        respond new TratamentoVigente(params)
    }

    @Secured(['ROLE_TRATAMENTOVIGENTE_ADD'])
    @Transactional
    def save(TratamentoVigente tratamentoVigenteInstance) {
        if (tratamentoVigenteInstance == null) {
            notFound()
            return
        }

        if (tratamentoVigenteInstance.hasErrors()) {
            respond tratamentoVigenteInstance.errors, view:'create'
            return
        }

        tratamentoVigenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tratamentoVigenteInstance.label', default: 'TratamentoVigente'), tratamentoVigenteInstance.id])
                redirect tratamentoVigenteInstance
            }
            '*' { respond tratamentoVigenteInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_TRATAMENTOVIGENTE_EDIT'])
    def edit(TratamentoVigente tratamentoVigenteInstance) {
        respond tratamentoVigenteInstance
    }

    @Secured(['ROLE_TRATAMENTOVIGENTE_EDIT'])
    @Transactional
    def update(TratamentoVigente tratamentoVigenteInstance) {
        if (tratamentoVigenteInstance == null) {
            notFound()
            return
        }

        if (tratamentoVigenteInstance.hasErrors()) {
            respond tratamentoVigenteInstance.errors, view:'edit'
            return
        }

        tratamentoVigenteInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TratamentoVigente.label', default: 'TratamentoVigente'), tratamentoVigenteInstance.id])
                redirect tratamentoVigenteInstance
            }
            '*'{ respond tratamentoVigenteInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_TRATAMENTOVIGENTE_DEL'])
    @Transactional
    def delete(TratamentoVigente tratamentoVigenteInstance) {

        if (tratamentoVigenteInstance == null) {
            notFound()
            return
        }

        tratamentoVigenteInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TratamentoVigente.label', default: 'TratamentoVigente'), tratamentoVigenteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tratamentoVigenteInstance.label', default: 'TratamentoVigente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
