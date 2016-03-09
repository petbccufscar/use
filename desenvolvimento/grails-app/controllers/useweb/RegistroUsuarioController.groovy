package useweb



import static org.springframework.http.HttpStatus.*
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegistroUsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]
    
    @Secured(['ROLE_REGISTROUSUARIO_SHOW'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegistroUsuario.list(params), model:[registroUsuarioInstanceCount: RegistroUsuario.count()]
    }
    
    @Secured(['ROLE_REGISTROUSUARIO_SHOW'])
    def show(RegistroUsuario registroUsuarioInstance) {
        respond registroUsuarioInstance
    }

    @Secured(['ROLE_REGISTROUSUARIO_ADD'])
    def create() {
        respond new RegistroUsuario(params)
    }

    @Secured(['ROLE_REGISTROUSUARIO_ADD'])
    @Transactional
    def save(RegistroUsuario registroUsuarioInstance) {
        if (registroUsuarioInstance == null) {
            notFound()
            return
        }

        if (registroUsuarioInstance.hasErrors()) {
            respond registroUsuarioInstance.errors, view:'create'
            return
        }

        registroUsuarioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registroUsuarioInstance.label', default: 'RegistroUsuario'), registroUsuarioInstance.id])
                redirect registroUsuarioInstance
            }
            '*' { respond registroUsuarioInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_REGISTROUSUARIO_EDIT'])
    def edit(RegistroUsuario registroUsuarioInstance) {
        respond registroUsuarioInstance
    }

    @Secured(['ROLE_REGISTROUSUARIO_EDIT'])
    @Transactional
    def update(RegistroUsuario registroUsuarioInstance) {
        if (registroUsuarioInstance == null) {
            notFound()
            return
        }

        if (registroUsuarioInstance.hasErrors()) {
            respond registroUsuarioInstance.errors, view:'edit'
            return
        }

        registroUsuarioInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegistroUsuario.label', default: 'RegistroUsuario'), registroUsuarioInstance.id])
                redirect registroUsuarioInstance
            }
            '*'{ respond registroUsuarioInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_REGISTROUSUARIO_DEL'])
    @Transactional
    def delete(RegistroUsuario registroUsuarioInstance) {

        if (registroUsuarioInstance == null) {
            notFound()
            return
        }

        registroUsuarioInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegistroUsuario.label', default: 'RegistroUsuario'), registroUsuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registroUsuarioInstance.label', default: 'RegistroUsuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
