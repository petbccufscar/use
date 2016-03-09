package UserManagement

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class UserController {

    static allowedMethods = [save: "POST", update: "POST"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]

    def springSecurityService

    def index() {
        log.info "* Method: index"
        log.debug "* Params: ${params}"
        
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_USER_SHOW'])
    def list(Integer max) {
        log.info "* Method: list"
        log.debug "* Params: ${params}"
        
        params.max = Math.min(max ?: 10, 100)
        
        def results = User.createCriteria().list(max: params.max, offset: params.offset ?: 0) {
            if (params.filter) {
                or {
                    ilike("userRealName", "%${params.filter}%")
                    ilike("username", "%${params.filter}%")
                    ilike("email", "%${params.filter}%")
                }
            }
            
            if (params.order) {
                order(params.sort, params.order)
            }
        }
        
        [userList: results, userTotal: results.totalCount]
    }

    @Secured(['ROLE_USER_ADD'])
    def create() {
        log.info "* Method: create"
        log.debug "* Params: ${params}"
        
        [user: new User(params), groups: []]
    }

    @Secured(['ROLE_USER_ADD'])
    def save() {
        log.info "* Method: save"
        log.debug "* Params: ${params}"
        
        def user = new User(params)
        def actualGroups = params.list('permissionGroups')
        
        boolean hasError = false
        
        if (params.username && params.username.equals(params.password)) {
            user.errors.rejectValue("password", "command.password.error.username", [] as Object[], "")
            hasError = true
        } else {
            if (!checkPasswordMinLength(params.password)) {
                user.errors.rejectValue("password", "command.password.minSize.notmet", [] as Object[], "")
                hasError = true
            } else {
                if (!checkPasswordMaxLength(params.password)) {
                    user.errors.rejectValue("password", "command.password.maxSize.exceeded", [] as Object[], "")
                    hasError = true
                } else {
                    if (!checkPasswordRegex(params.password)) {
                        user.errors.rejectValue("password", "command.password.error.strength", [] as Object[], "")
                        hasError = true
                    }
                }
            }
        }
        
        if (params.password != params.passwordConfirm) {
            params.error = message(code: 'command.password2.error.mismatch')
            hasError = true
        }
        
        if (hasError) {
            user.discard()
            render(view: "create", model: [user: user, groups: actualGroups])
            return
        }
        
        if (user.hasErrors() || !user.saveWithGroups(actualGroups)) {
            render(view: "create", model: [user: user])
            return
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    @Secured(['ROLE_USER_SHOW'])
    def show(Long id) {
        log.info "* Method: show"
        log.debug "* Params: ${params}"
        
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        
        [user: user]
    }

    @Secured(['ROLE_USER_EDIT'])
    def edit(Long id) {
        log.info "* Method: edit"
        log.debug "* Params: ${params}"
        
        def user = User.get(id)
        def actualGroups = user ? user?.groups*.id : []
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        
        if (user.system) {
            flash.message = message(code: 'default.not.updated.message', args: [message(code: 'user.label'), id])
            redirect(action: "show", id: id)
            return
        }
        
        [user: user, groups: actualGroups]
    }

    @Secured(['ROLE_USER_EDIT'])
    def update(Long id, Long version) {
        log.info "* Method: update"
        log.debug "* Params: ${params}"
        
        def user = User.get(id)
        def actualGroups = params.list('permissionGroups')
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        
        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [user: user, groups: actualGroups])
                return
            }
        }
        
        user.properties = params
        
        boolean hasError = false
        
        if (params.username && params.username.equals(params.password)) {
            user.errors.rejectValue("password", "command.password.error.username", [] as Object[], "")
            hasError = true
        } else {
            if (!checkPasswordMinLength(params.password)) {
                user.errors.rejectValue("password", "command.password.minSize.notmet", [] as Object[], "")
                hasError = true
            } else {
                if (!checkPasswordMaxLength(params.password)) {
                    user.errors.rejectValue("password", "command.password.maxSize.exceeded", [] as Object[], "")
                    hasError = true
                } else {
                    if (!checkPasswordRegex(params.password)) {
                        user.errors.rejectValue("password", "command.password.error.strength", [] as Object[], "")
                        hasError = true
                    }
                }
            }
        }
        
        if (params.password != params.passwordConfirm) {
            params.error = message(code: 'command.password2.error.mismatch')
            hasError = true
        }
        
        if (hasError) {
            user.discard()
            render(view: "edit", model: [user: user])
            return
        }
        
        if (user.hasErrors() || !user.saveWithGroups(actualGroups)) {
            render(view: "edit", model: [user: user, groups: actualGroups])
            return
        }
        
        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    @Secured(['ROLE_USER_DEL'])
    def delete(Long id) {
        log.info "* Method: delete"
        log.debug "* Params: ${params}"
        
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
        
        if (user.system) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label'), id])
            redirect(action: "show", id: id)
            return
        }
        
        try {
            user.deleteWithRelationships()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def editProfile() {
        log.info "* Method: editProfile"
        log.debug "* Params: ${params}"
        
        def user = User.findByUsername(springSecurityService.currentUser.username)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(controller: "index", action: "index")
            return
        }
        
        [user: user]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def updateProfile(Long version) {
        log.info "* Method: updateProfile"
        log.debug "* Params: ${params}"
        
        def user = User.findByUsername(springSecurityService.currentUser.username)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(controller: "index", action: "index")
            return
        }
        
        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "editProfile", model: [user: user])
                return
            }
        }
        
        user.properties = params
        
        boolean hasError = false
        
        if (params.username && params.username.equals(params.password)) {
            user.errors.rejectValue("password", "command.password.error.username", [] as Object[], "")
            hasError = true
        } else {
            if (!checkPasswordMinLength(params.password)) {
                user.errors.rejectValue("password", "command.password.minSize.notmet", [] as Object[], "")
                hasError = true
            } else {
                if (!checkPasswordMaxLength(params.password)) {
                    user.errors.rejectValue("password", "command.password.maxSize.exceeded", [] as Object[], "")
                    hasError = true
                } else {
                    if (!checkPasswordRegex(params.password)) {
                        user.errors.rejectValue("password", "command.password.error.strength", [] as Object[], "")
                        hasError = true
                    }
                }
            }
        }
        
        if (params.password != params.passwordConfirm) {
            params.error = message(code: 'command.password2.error.mismatch')
            hasError = true
        }
        
        if (hasError) {
            user.discard()
            render(view: "editProfile", model: [user: user])
            return
        }
        
        if (user.hasErrors() || !user.save(flush: true)) {
            render(view: "editProfile", model: [user: user])
            return
        }
        
        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(controller: "index", action: "index")
    }

    static boolean checkPasswordMinLength(String password) {
        def conf = SpringSecurityUtils.securityConfig
        
        int minLength = conf.ui.password.minLength instanceof Number ? conf.ui.password.minLength : 8
        
        password && password.length() >= minLength
    }

    static boolean checkPasswordMaxLength(String password) {
        def conf = SpringSecurityUtils.securityConfig
        
        int maxLength = conf.ui.password.maxLength instanceof Number ? conf.ui.password.maxLength : 64
        
        password && password.length() <= maxLength
    }

    static boolean checkPasswordRegex(String password) {
        def conf = SpringSecurityUtils.securityConfig
        
        String passValidationRegex = conf.ui.password.validationRegex ?: '^.*(?=.*\\d)(?=.*[a-zA-Z]).*$'
        
        password && password.matches(passValidationRegex)
    }
}
