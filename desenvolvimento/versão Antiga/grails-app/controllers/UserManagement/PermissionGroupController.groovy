package UserManagement

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class PermissionGroupController {

    static allowedMethods = [save: "POST", update: "POST"]

    static roles = ["SHOW", "ADD", "EDIT", "DEL"]

    def index() {
        log.info "* Method: index"
        log.debug "* Params: ${params}"
        
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_PERMISSIONGROUP_SHOW'])
    def list(Integer max) {
        log.info "* Method: list"
        log.debug "* Params: ${params}"
        
        params.max = Math.min(max ?: 10, 100)
        
        def results = PermissionGroup.createCriteria().list(max: params.max, offset: params.offset ?:0) {
            if (params.filter) {
                or {
                    ilike("name", "%${params.filter}%")
                }
            }
            
            if (params.order) {
                order(params.sort, params.order)
            }
        }
        
        [permissionGroupList: results, permissionGroupTotal: results.totalCount]
    }

    @Secured(['ROLE_PERMISSIONGROUP_ADD'])
    def create() {
        log.info "* Method: create"
        log.debug "* Params: ${params}"
        
        def allUsers = User.createCriteria().list {
            order('userRealName', 'asc')
        }
        
        [permissionGroup: new PermissionGroup(params), allUsers: allUsers, users: [], roles: []]
    }

    @Secured(['ROLE_PERMISSIONGROUP_ADD'])
    def save() {
        log.info "* Method: save"
        log.debug "* Params: ${params}"
        
        def permissionGroup = new PermissionGroup(params)
        def actualUsers = params.list('users')
        def actualRoles = params.list('roles')
        if (!permissionGroup.saveWithRelationships(actualRoles, actualUsers)) {
            def allUsers = User.createCriteria().list {
                order('userRealName', 'asc')
            }
            
            render(view: "create", model: [permissionGroup: permissionGroup, allUsers: allUsers, users: actualUsers, roles: actualRoles])
            return
        }
        
        flash.message = message(code: 'default.created.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), permissionGroup.id])
        redirect(action: "show", id: permissionGroup.id)
    }

    @Secured(['ROLE_PERMISSIONGROUP_SHOW'])
    def show(Long id) {
        log.info "* Method: show"
        log.debug "* Params: ${params}"
        
        def permissionGroup = PermissionGroup.get(id)
        if (!permissionGroup) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "list")
            return
        }
        
        [permissionGroup: permissionGroup]
    }

    @Secured(['ROLE_PERMISSIONGROUP_EDIT'])
    def edit(Long id) {
        log.info "* Method: edit"
        log.debug "* Params: ${params}"
        
        def permissionGroup = PermissionGroup.get(id)
        def actualUsers = permissionGroup ? permissionGroup?.usersGroup*.user?.id : []
        def actualRoles = permissionGroup ? permissionGroup?.rolesGroup*.role?.id : []
        if (!permissionGroup) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "list")
            return
        }
        
        if (permissionGroup.system) {
            flash.message = message(code: 'default.not.updated.message', args: [message(code: 'permissionGroup.label'), id])
            redirect(action: "show", id: id)
            return
        }
        
        def allUsers = User.createCriteria().list {
            order('userRealName', 'asc')
        }
        
        [permissionGroup: permissionGroup, allUsers: allUsers, users: actualUsers, roles: actualRoles]
    }

    @Secured(['ROLE_PERMISSIONGROUP_EDIT'])
    def update(Long id, Long version) {
        log.info "* Method: update"
        log.debug "* Params: ${params}"
        
        def permissionGroup = PermissionGroup.get(id)
        def actualUsers = params.list('users')
        def actualRoles = params.list('roles')
        if (!permissionGroup) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "list")
            return
        }
        
        if (version != null) {
            if (permissionGroup.version > version) {
                permissionGroup.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'permissionGroup.label', default: 'PermissionGroup')] as Object[],
                          "Another user has updated this PermissionGroup while you were editing")
                def allUsers = User.createCriteria().list {
                    order('userRealName', 'asc')
                }
                
                render(view: "edit", model: [permissionGroup: permissionGroup, allUsers: allUsers, users: actualUsers, roles: actualRoles])
                return
            }
        }
        
        permissionGroup.properties = params
        
        if (permissionGroup.hasErrors() || !permissionGroup.saveWithRelationships(actualRoles, actualUsers)) {
            def allUsers = User.createCriteria().list {
                order('userRealName', 'asc')
            }
            
            render(view: "edit", model: [permissionGroup: permissionGroup, allUsers: allUsers, users: actualUsers, roles: actualRoles])
            return
        }
        
        flash.message = message(code: 'default.updated.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), permissionGroup.id])
        redirect(action: "show", id: permissionGroup.id)
    }

    @Secured(['ROLE_PERMISSIONGROUP_DEL'])
    def delete(Long id) {
        log.info "* Method: delete"
        log.debug "* Params: ${params}"
        
        def permissionGroup = PermissionGroup.get(id)
        if (!permissionGroup) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "list")
            return
        }
        
        if (permissionGroup.system) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'permissionGroup.label'), id])
            redirect(action: "show", id: id)
            return
        }
        
        try {
            permissionGroup.deleteWithRelationships()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'permissionGroup.label', default: 'PermissionGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
