package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LinhadeCuidadoAreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_LINHADECUIDADOAREA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LinhadeCuidadoArea.list(params), model:[linhadeCuidadoAreaInstanceCount: LinhadeCuidadoArea.count()]
    }
    
    @Secured(['ROLE_LINHADECUIDADOAREA_SHOW'])
    def show(LinhadeCuidadoArea linhadeCuidadoAreaInstance) {
        respond linhadeCuidadoAreaInstance
    }

    @Secured(['ROLE_LINHADECUIDADOAREA_ADD'])
    def create() {
        respond new LinhadeCuidadoArea(params)
    }

    @Secured(['ROLE_LINHADECUIDADOAREA_ADD'])
    @Transactional
    def save(LinhadeCuidadoArea linhadeCuidadoAreaInstance) {
        if (linhadeCuidadoAreaInstance == null) {
            notFound()
            return
        }

        if (linhadeCuidadoAreaInstance.hasErrors()) {
            respond linhadeCuidadoAreaInstance.errors, view:'create'
            return
        }

        linhadeCuidadoAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'linhadeCuidadoAreaInstance.label', default: 'LinhadeCuidadoArea'), linhadeCuidadoAreaInstance.id])
                redirect linhadeCuidadoAreaInstance
            }
            '*' { respond linhadeCuidadoAreaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_LINHADECUIDADOAREA_EDIT'])
    def edit(LinhadeCuidadoArea linhadeCuidadoAreaInstance) {
        respond linhadeCuidadoAreaInstance
    }

    @Secured(['ROLE_LINHADECUIDADOAREA_EDIT'])
    @Transactional
    def update(LinhadeCuidadoArea linhadeCuidadoAreaInstance) {
        if (linhadeCuidadoAreaInstance == null) {
            notFound()
            return
        }

        if (linhadeCuidadoAreaInstance.hasErrors()) {
            respond linhadeCuidadoAreaInstance.errors, view:'edit'
            return
        }

        linhadeCuidadoAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LinhadeCuidadoArea.label', default: 'LinhadeCuidadoArea'), linhadeCuidadoAreaInstance.id])
                redirect linhadeCuidadoAreaInstance
            }
            '*'{ respond linhadeCuidadoAreaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_LINHADECUIDADOAREA_DEL'])
    @Transactional
    def delete(LinhadeCuidadoArea linhadeCuidadoAreaInstance) {

        if (linhadeCuidadoAreaInstance == null) {
            notFound()
            return
        }

        linhadeCuidadoAreaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LinhadeCuidadoArea.label', default: 'LinhadeCuidadoArea'), linhadeCuidadoAreaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linhadeCuidadoAreaInstance.label', default: 'LinhadeCuidadoArea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
