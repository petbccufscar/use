package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PesquisaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_PESQUISA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pesquisa.list(params), model:[pesquisaInstanceCount: Pesquisa.count()]
    }
    
    @Secured(['ROLE_PESQUISA_SHOW'])
    def show(Pesquisa pesquisaInstance) {
        respond pesquisaInstance
    }

    @Secured(['ROLE_PESQUISA_ADD'])
    def create() {
        respond new Pesquisa(params)
    }

    @Secured(['ROLE_PESQUISA_ADD'])
    @Transactional
    def save(Pesquisa pesquisaInstance) {
        if (pesquisaInstance == null) {
            notFound()
            return
        }

        if (pesquisaInstance.hasErrors()) {
            respond pesquisaInstance.errors, view:'create'
            return
        }

        pesquisaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pesquisaInstance.label', default: 'Pesquisa'), pesquisaInstance.id])
                redirect pesquisaInstance
            }
            '*' { respond pesquisaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PESQUISA_EDIT'])
    def edit(Pesquisa pesquisaInstance) {
        respond pesquisaInstance
    }

    @Secured(['ROLE_PESQUISA_EDIT'])
    @Transactional
    def update(Pesquisa pesquisaInstance) {
        if (pesquisaInstance == null) {
            notFound()
            return
        }

        if (pesquisaInstance.hasErrors()) {
            respond pesquisaInstance.errors, view:'edit'
            return
        }

        pesquisaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pesquisa.label', default: 'Pesquisa'), pesquisaInstance.id])
                redirect pesquisaInstance
            }
            '*'{ respond pesquisaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_PESQUISA_DEL'])
    @Transactional
    def delete(Pesquisa pesquisaInstance) {

        if (pesquisaInstance == null) {
            notFound()
            return
        }

        pesquisaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pesquisa.label', default: 'Pesquisa'), pesquisaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pesquisaInstance.label', default: 'Pesquisa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
