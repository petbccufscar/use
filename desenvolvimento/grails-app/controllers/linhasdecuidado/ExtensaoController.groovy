package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExtensaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_EXTENSAO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Extensao.list(params), model:[extensaoInstanceCount: Extensao.count()]
    }
    
    @Secured(['ROLE_EXTENSAO_SHOW'])
    def show(Extensao extensaoInstance) {
        respond extensaoInstance
    }

    @Secured(['ROLE_EXTENSAO_ADD'])
    def create() {
        respond new Extensao(params)
    }

    @Secured(['ROLE_EXTENSAO_ADD'])
    @Transactional
    def save(Extensao extensaoInstance) {
        if (extensaoInstance == null) {
            notFound()
            return
        }

        if (extensaoInstance.hasErrors()) {
            respond extensaoInstance.errors, view:'create'
            return
        }

        extensaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'extensaoInstance.label', default: 'Extensao'), extensaoInstance.id])
                redirect extensaoInstance
            }
            '*' { respond extensaoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_EXTENSAO_EDIT'])
    def edit(Extensao extensaoInstance) {
        respond extensaoInstance
    }

    @Secured(['ROLE_EXTENSAO_EDIT'])
    @Transactional
    def update(Extensao extensaoInstance) {
        if (extensaoInstance == null) {
            notFound()
            return
        }

        if (extensaoInstance.hasErrors()) {
            respond extensaoInstance.errors, view:'edit'
            return
        }

        extensaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Extensao.label', default: 'Extensao'), extensaoInstance.id])
                redirect extensaoInstance
            }
            '*'{ respond extensaoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_EXTENSAO_DEL'])
    @Transactional
    def delete(Extensao extensaoInstance) {

        if (extensaoInstance == null) {
            notFound()
            return
        }

        extensaoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Extensao.label', default: 'Extensao'), extensaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'extensaoInstance.label', default: 'Extensao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
