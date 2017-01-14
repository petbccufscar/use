package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDeCursoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_TIPODECURSO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDeCurso.list(params), model:[tipoDeCursoInstanceCount: TipoDeCurso.count()]
    }
    
    @Secured(['ROLE_TIPODECURSO_SHOW'])
    def show(TipoDeCurso tipoDeCursoInstance) {
        respond tipoDeCursoInstance
    }

    @Secured(['ROLE_TIPODECURSO_ADD'])
    def create() {
        respond new TipoDeCurso(params)
    }

    @Secured(['ROLE_TIPODECURSO_ADD'])
    @Transactional
    def save(TipoDeCurso tipoDeCursoInstance) {
        if (tipoDeCursoInstance == null) {
            notFound()
            return
        }

        if (tipoDeCursoInstance.hasErrors()) {
            respond tipoDeCursoInstance.errors, view:'create'
            return
        }

        tipoDeCursoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDeCursoInstance.label', default: 'TipoDeCurso'), tipoDeCursoInstance.id])
                redirect tipoDeCursoInstance
            }
            '*' { respond tipoDeCursoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_TIPODECURSO_EDIT'])
    def edit(TipoDeCurso tipoDeCursoInstance) {
        respond tipoDeCursoInstance
    }

    @Secured(['ROLE_TIPODECURSO_EDIT'])
    @Transactional
    def update(TipoDeCurso tipoDeCursoInstance) {
        if (tipoDeCursoInstance == null) {
            notFound()
            return
        }

        if (tipoDeCursoInstance.hasErrors()) {
            respond tipoDeCursoInstance.errors, view:'edit'
            return
        }

        tipoDeCursoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDeCurso.label', default: 'TipoDeCurso'), tipoDeCursoInstance.id])
                redirect tipoDeCursoInstance
            }
            '*'{ respond tipoDeCursoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_TIPODECURSO_DEL'])
    @Transactional
    def delete(TipoDeCurso tipoDeCursoInstance) {

        if (tipoDeCursoInstance == null) {
            notFound()
            return
        }

        tipoDeCursoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDeCurso.label', default: 'TipoDeCurso'), tipoDeCursoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDeCursoInstance.label', default: 'TipoDeCurso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
