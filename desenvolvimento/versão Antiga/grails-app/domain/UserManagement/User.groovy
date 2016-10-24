package UserManagement

class User {
    transient springSecurityService
    
    static hasMany = [usersGroup: UserGroup]
    
    static transients = ['ableToLogin']
    
    String userRealName
    String username
    String password
    String email
    Boolean enabled = Boolean.TRUE
    Boolean accountExpired = Boolean.FALSE
    Boolean accountLocked = Boolean.FALSE
    Boolean passwordExpired = Boolean.FALSE
    Boolean system = Boolean.FALSE
    
    void setUserRealName(String userRealName) {
        this.userRealName = userRealName.toUpperCase()
    }
    
    static constraints = {
        userRealName(blank: false, nullable: false, unique: true)
        username(blank: false, nullable: false, unique: true)
        password(blank: false, nullable: false)
        email(blank: false, nullable: false, email: true)
    }
    
    static mapping = {
        table 'users' // user is a reserver word in some databases, like Microsoft SQLServer
        password column: 'password'
        userRealName index: 'UserRealName_Idx'
        username index: 'Username_Idx'
        
        cache: 'nonstrict-read-write'
        sort: 'userRealName'
    }
    
    Set<Role> getAuthorities() {
        UserGroup.withSession {
            def permissionGroups = usersGroup*.group
            
            def roles = []
            permissionGroups.each { permissionGroup ->
                roles += permissionGroup.rolesGroup*.role
            }
            
            return roles as Set
        }
    }
    
    Set<PermissionGroup> getGroups() {
        User.withSession { org.hibernate.Session session ->
            return usersGroup?.collect() { it.group } as Set
        }
    }
    
    def beforeInsert() {
        encodePassword()
    }
    
    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }
    
    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
    
    def deleteWithRelationships() {
        User.withTransaction { status ->
            // Deletes all the UserGroup entries related to this User
            UserGroup.removeAll(this)
            
            // Deletes this instance
            this.delete()
        }
    }
    
    def saveWithGroups(groups) {
        return User.withTransaction { status ->
            // Saves the User
            if (!this.save(flush: true)) {
                log.error "Falha ao salvar User"
                status.setRollbackOnly()
                return false
            }
            
            log.debug "Removendo todos os UserGroup associados a esse User..."
            UserGroup.removeAll(this)
            log.debug "UserGroups removidos"
            
            def groupAssociation = groups.each { groupId ->
                def pg = PermissionGroup.get(groupId as Long)
                def userGroup = new UserGroup(user: this, group: pg)
                if (!userGroup.save(flush: true, failOnError: true)) {
                    log.error "Erro salvando grupo de usuario"
                    status.setRollbackOnly()
                    return -1
                }
            }
            
            return groupAssociation == -1 ? false : true
        }
    }
    
    def getAbleToLogin() {
        return enabled && !accountExpired && !accountLocked && !passwordExpired
    }
    
    String toString() {
        return userRealName
    }
}
