package UserManagement

class PermissionGroup {
    static hasMany = [rolesGroup: RoleGroup, usersGroup: UserGroup]
    
    String name
    Boolean system = Boolean.FALSE
    
    void setName(String name) {
        this.name = name.toUpperCase()
    }
    
    static constraints = {
        name(blank: false, nullable: false, unique: true)
        system(blank: false, nullable: false)
        rolesGroup()
        usersGroup()
    }
    
    static mapping = {
        cache: 'nonstrict-read-write'
        sort: 'name'
    }
    
    def saveWithRelationships(def roles, def users) {
        PermissionGroup.withTransaction { status ->
            // Saves the PermissionGroup
            if (!this.save(flush: true)) {
                log.error "Falha ao salvar PermissionGroup"
                status.setRollbackOnly()
                return false
            }
            
            // First, deletes all the RoleGroup entries related to this PermissionGroup
            log.debug "Removendo todos os RoleGroup associados a esse PermissionGroup"
            RoleGroup.removeAll(this)
            log.debug "Remoção teve sucesso"
            
            // Deletes all the UserGroup entries related to this PermissionGroup
            log.debug "Removendo todos os UserGroup associados a esse PermissionGroup"
            UserGroup.removeAll(this)
            log.debug "Remoção teve sucesso"
            
            // Now add the selected Roles
            roles.each { roleId ->
                log.debug "Criando RoleGroup para role id $roleId"
                if (!RoleGroup.create(Role.load(roleId as Long), this, false)) {
                    log.error "Falha ao criar RoleGroup para role id $roleId"
                    return false
                }
            }
            
            // Add the selected Users
            users?.each { userId ->
                log.debug "Criando UserGroup para user id $userId"
                if (!UserGroup.create(User.load(userId as Long), this, false)) {
                    log.error "Falha ao criar UserGroup para user id $roleId"
                    status.setRollbackOnly()
                    return false
                }
            }
            
            return this
        }
    }
    
    def deleteWithRelationships() {
        PermissionGroup.withTransaction { status ->
            // Deletes all the RoleGroup entries related to this Permission Group
            RoleGroup.removeAll(this)
            
            // Deletes all the UserGroup entries related to this Permission Group
            UserGroup.removeAll(this)
            
            // Deletes the instance
            this.delete()
        }
    }
    
    String toString() {
        return name
    }
}
