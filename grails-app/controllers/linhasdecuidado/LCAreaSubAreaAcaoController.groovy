package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LCAreaSubAreaAcaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_LCAREASUBAREAACAO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LCAreaSubAreaAcao.list(params), model:[LCAreaSubAreaAcaoInstanceCount: LCAreaSubAreaAcao.count()]
    }
    
    @Secured(['ROLE_LCAREASUBAREAACAO_SHOW'])
    def show(LCAreaSubAreaAcao LCAreaSubAreaAcaoInstance) {
        respond LCAreaSubAreaAcaoInstance
    }

    @Secured(['ROLE_LCAREASUBAREAACAO_ADD'])
    def create() {
        respond new LCAreaSubAreaAcao(params)
    }

    @Secured(['ROLE_LCAREASUBAREAACAO_ADD'])
    @Transactional
    def save(LCAreaSubAreaAcao LCAreaSubAreaAcaoInstance) {
        if (LCAreaSubAreaAcaoInstance == null) {
            notFound()
            return
        }

        if (LCAreaSubAreaAcaoInstance.hasErrors()) {
            respond LCAreaSubAreaAcaoInstance.errors, view:'create'
            return
        }

        LCAreaSubAreaAcaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'LCAreaSubAreaAcaoInstance.label', default: 'LCAreaSubAreaAcao'), LCAreaSubAreaAcaoInstance.id])
                redirect LCAreaSubAreaAcaoInstance
            }
            '*' { respond LCAreaSubAreaAcaoInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_LCAREASUBAREAACAO_EDIT'])
    def edit(LCAreaSubAreaAcao LCAreaSubAreaAcaoInstance) {
        respond LCAreaSubAreaAcaoInstance
    }

    @Secured(['ROLE_LCAREASUBAREAACAO_EDIT'])
    @Transactional
    def update(LCAreaSubAreaAcao LCAreaSubAreaAcaoInstance) {
        if (LCAreaSubAreaAcaoInstance == null) {
            notFound()
            return
        }

        if (LCAreaSubAreaAcaoInstance.hasErrors()) {
            respond LCAreaSubAreaAcaoInstance.errors, view:'edit'
            return
        }

        LCAreaSubAreaAcaoInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LCAreaSubAreaAcao.label', default: 'LCAreaSubAreaAcao'), LCAreaSubAreaAcaoInstance.id])
                redirect LCAreaSubAreaAcaoInstance
            }
            '*'{ respond LCAreaSubAreaAcaoInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_LCAREASUBAREAACAO_DEL'])
    @Transactional
    def delete(LCAreaSubAreaAcao LCAreaSubAreaAcaoInstance) {

        if (LCAreaSubAreaAcaoInstance == null) {
            notFound()
            return
        }

        LCAreaSubAreaAcaoInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LCAreaSubAreaAcao.label', default: 'LCAreaSubAreaAcao'), LCAreaSubAreaAcaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'LCAreaSubAreaAcaoInstance.label', default: 'LCAreaSubAreaAcao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
