package linhasdecuidado



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RelacoesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LCAreaSubArea.list(params), model:[list:LCAreaSubArea.list(params), relacoesInstanceCount: LCAreaSubArea.count()]
    }

    def show() {
        println params
         def relacoesInstance = LCAreaSubArea.get(params.id)
         println relacoesInstance
        respond relacoesInstance, model:[instance:relacoesInstance]
    }

    def create() {
        respond new Relacoes(params)
    }

    @Transactional
    def save() {
        def aux = new LinhadeCuidadoArea(area:params.area, linhadecuidado:params.linhadecuidado).save();
        def relacoesInstance = new LCAreaSubArea(linhadecuidadoarea:aux, subarea:params.subarea);
        
        if (relacoesInstance == null) {
            notFound()
            return
        }

        if (relacoesInstance.hasErrors()) {
            respond relacoesInstance.errors, view:'create'
            return
        }

        relacoesInstance.save flush:true
        
     
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'relacoesInstance.label', default: 'Relacoes'), relacoesInstance.id])
               
                redirect relacoesInstance
            }
            '*' { respond relacoesInstance, [status: CREATED] }
        }
    }

    def edit() {
        respond relacoesInstance
    }

    @Transactional
    def update(Relacoes relacoesInstance) {
        if (relacoesInstance == null) {
            notFound()
            return
        }

        if (relacoesInstance.hasErrors()) {
            respond relacoesInstance.errors, view:'edit'
            return
        }

        relacoesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Relacoes.label', default: 'Relacoes'), relacoesInstance.id])
                redirect relacoesInstance
            }
            '*'{ respond relacoesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Relacoes relacoesInstance) {

        if (relacoesInstance == null) {
            notFound()
            return
        }

        relacoesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Relacoes.label', default: 'Relacoes'), relacoesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'relacoesInstance.label', default: 'Relacoes'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
