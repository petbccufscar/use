package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DepartamentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_DEPARTAMENTO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Departamento.list(params), model:[departamentoInstanceCount: Departamento.count()]
    }
    
    @Secured(['ROLE_DEPARTAMENTO_SHOW'])
    def show(Departamento departamentoInstance) {
        respond departamentoInstance
    }

    @Secured(['ROLE_DEPARTAMENTO_ADD'])
    def create() {
        respond new Departamento(params)
    }

    @Secured(['ROLE_DEPARTAMENTO_ADD'])
    @Transactional
    def save(Departamento departamentoInstance) {
        println(params)
        if (departamentoInstance == null) {
            notFound()
            return
        }

        if (departamentoInstance.hasErrors()) {
            respond departamentoInstance.errors, view:'create'
            return
        }

        departamentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamentoInstance.label', default: 'Departamento'), departamentoInstance.id])
                redirect departamentoInstance
            }
            '*' { respond departamentoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_DEPARTAMENTO_EDIT'])
    def edit(Departamento departamentoInstance) {
        respond departamentoInstance
    }

    @Secured(['ROLE_DEPARTAMENTO_EDIT'])
    @Transactional
    def update(Departamento departamentoInstance) {
        if (departamentoInstance == null) {
            notFound()
            return
        }

        if (departamentoInstance.hasErrors()) {
            respond departamentoInstance.errors, view:'edit'
            return
        }

        departamentoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Departamento.label', default: 'Departamento'), departamentoInstance.id])
                redirect departamentoInstance
            }
            '*'{ respond departamentoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_DEPARTAMENTO_DEL'])
    @Transactional
    def delete(Departamento departamentoInstance) {

        if (departamentoInstance == null) {
            notFound()
            return
        }

        departamentoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Departamento.label', default: 'Departamento'), departamentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamentoInstance.label', default: 'Departamento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
