package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LCAreaSubAreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_LCAREASUBAREA_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LCAreaSubArea.list(params), model:[LCAreaSubAreaInstanceCount: LCAreaSubArea.count()]
    }
    
    @Secured(['ROLE_LCAREASUBAREA_SHOW'])
    def show(LCAreaSubArea LCAreaSubAreaInstance) {
        respond LCAreaSubAreaInstance
    }

    @Secured(['ROLE_LCAREASUBAREA_ADD'])
    def create() {
        respond new LCAreaSubArea(params)
    }

    @Secured(['ROLE_LCAREASUBAREA_ADD'])
    @Transactional
    def save(LCAreaSubArea LCAreaSubAreaInstance) {
        if (LCAreaSubAreaInstance == null) {
            notFound()
            return
        }

        if (LCAreaSubAreaInstance.hasErrors()) {
            respond LCAreaSubAreaInstance.errors, view:'create'
            return
        }

        LCAreaSubAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'LCAreaSubAreaInstance.label', default: 'LCAreaSubArea'), LCAreaSubAreaInstance.id])
                redirect LCAreaSubAreaInstance
            }
            '*' { respond LCAreaSubAreaInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_LCAREASUBAREA_EDIT'])
    def edit(LCAreaSubArea LCAreaSubAreaInstance) {
        respond LCAreaSubAreaInstance
    }

    @Secured(['ROLE_LCAREASUBAREA_EDIT'])
    @Transactional
    def update(LCAreaSubArea LCAreaSubAreaInstance) {
        if (LCAreaSubAreaInstance == null) {
            notFound()
            return
        }

        if (LCAreaSubAreaInstance.hasErrors()) {
            respond LCAreaSubAreaInstance.errors, view:'edit'
            return
        }

        LCAreaSubAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea'), LCAreaSubAreaInstance.id])
                redirect LCAreaSubAreaInstance
            }
            '*'{ respond LCAreaSubAreaInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_LCAREASUBAREA_DEL'])
    @Transactional
    def delete(LCAreaSubArea LCAreaSubAreaInstance) {

        if (LCAreaSubAreaInstance == null) {
            notFound()
            return
        }

        LCAreaSubAreaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LCAreaSubArea.label', default: 'LCAreaSubArea'), LCAreaSubAreaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'LCAreaSubAreaInstance.label', default: 'LCAreaSubArea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
