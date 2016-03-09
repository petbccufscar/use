package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LinhaDeCuidadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_LINHADECUIDADO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LinhaDeCuidado.list(params), model:[linhaDeCuidadoInstanceCount: LinhaDeCuidado.count()]
    }
    
    @Secured(['ROLE_LINHADECUIDADO_SHOW'])
    def show(LinhaDeCuidado linhaDeCuidadoInstance) {
        respond linhaDeCuidadoInstance
    }

    @Secured(['ROLE_LINHADECUIDADO_ADD'])
    def create() {
        respond new LinhaDeCuidado(params)
    }

    @Secured(['ROLE_LINHADECUIDADO_ADD'])
    @Transactional
    def save(LinhaDeCuidado linhaDeCuidadoInstance) {
        if (linhaDeCuidadoInstance == null) {
            notFound()
            return
        }

        if (linhaDeCuidadoInstance.hasErrors()) {
            respond linhaDeCuidadoInstance.errors, view:'create'
            return
        }

        linhaDeCuidadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'linhaDeCuidadoInstance.label', default: 'LinhaDeCuidado'), linhaDeCuidadoInstance.id])
                redirect linhaDeCuidadoInstance
            }
            '*' { respond linhaDeCuidadoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_LINHADECUIDADO_EDIT'])
    def edit(LinhaDeCuidado linhaDeCuidadoInstance) {
        respond linhaDeCuidadoInstance
    }

    @Secured(['ROLE_LINHADECUIDADO_EDIT'])
    @Transactional
    def update(LinhaDeCuidado linhaDeCuidadoInstance) {
        if (linhaDeCuidadoInstance == null) {
            notFound()
            return
        }

        if (linhaDeCuidadoInstance.hasErrors()) {
            respond linhaDeCuidadoInstance.errors, view:'edit'
            return
        }

        linhaDeCuidadoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LinhaDeCuidado.label', default: 'LinhaDeCuidado'), linhaDeCuidadoInstance.id])
                redirect linhaDeCuidadoInstance
            }
            '*'{ respond linhaDeCuidadoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_LINHADECUIDADO_DEL'])
    @Transactional
    def delete(LinhaDeCuidado linhaDeCuidadoInstance) {

        if (linhaDeCuidadoInstance == null) {
            notFound()
            return
        }

        linhaDeCuidadoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LinhaDeCuidado.label', default: 'LinhaDeCuidado'), linhaDeCuidadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linhaDeCuidadoInstance.label', default: 'LinhaDeCuidado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
