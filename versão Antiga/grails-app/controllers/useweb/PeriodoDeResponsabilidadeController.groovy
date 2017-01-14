package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PeriodoDeResponsabilidadeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_PERIODODERESPONSABILIDADE_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PeriodoDeResponsabilidade.list(params), model:[periodoDeResponsabilidadeInstanceCount: PeriodoDeResponsabilidade.count()]
    }
    
    @Secured(['ROLE_PERIODODERESPONSABILIDADE_SHOW'])
    def show(PeriodoDeResponsabilidade periodoDeResponsabilidadeInstance) {
        respond periodoDeResponsabilidadeInstance
    }

    @Secured(['ROLE_PERIODODERESPONSABILIDADE_ADD'])
    def create() {
        respond new PeriodoDeResponsabilidade(params)
    }

    @Secured(['ROLE_PERIODODERESPONSABILIDADE_ADD'])
    @Transactional
    def save(PeriodoDeResponsabilidade periodoDeResponsabilidadeInstance) {
        if (periodoDeResponsabilidadeInstance == null) {
            notFound()
            return
        }

        if (periodoDeResponsabilidadeInstance.hasErrors()) {
            respond periodoDeResponsabilidadeInstance.errors, view:'create'
            return
        }

        periodoDeResponsabilidadeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'periodoDeResponsabilidadeInstance.label', default: 'PeriodoDeResponsabilidade'), periodoDeResponsabilidadeInstance.id])
                redirect periodoDeResponsabilidadeInstance
            }
            '*' { respond periodoDeResponsabilidadeInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_PERIODODERESPONSABILIDADE_EDIT'])
    def edit(PeriodoDeResponsabilidade periodoDeResponsabilidadeInstance) {
        respond periodoDeResponsabilidadeInstance
    }

    @Secured(['ROLE_PERIODODERESPONSABILIDADE_EDIT'])
    @Transactional
    def update(PeriodoDeResponsabilidade periodoDeResponsabilidadeInstance) {
        if (periodoDeResponsabilidadeInstance == null) {
            notFound()
            return
        }

        if (periodoDeResponsabilidadeInstance.hasErrors()) {
            respond periodoDeResponsabilidadeInstance.errors, view:'edit'
            return
        }

        periodoDeResponsabilidadeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PeriodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade'), periodoDeResponsabilidadeInstance.id])
                redirect periodoDeResponsabilidadeInstance
            }
            '*'{ respond periodoDeResponsabilidadeInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_PERIODODERESPONSABILIDADE_DEL'])
    @Transactional
    def delete(PeriodoDeResponsabilidade periodoDeResponsabilidadeInstance) {

        if (periodoDeResponsabilidadeInstance == null) {
            notFound()
            return
        }

        periodoDeResponsabilidadeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PeriodoDeResponsabilidade.label', default: 'PeriodoDeResponsabilidade'), periodoDeResponsabilidadeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'periodoDeResponsabilidadeInstance.label', default: 'PeriodoDeResponsabilidade'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
