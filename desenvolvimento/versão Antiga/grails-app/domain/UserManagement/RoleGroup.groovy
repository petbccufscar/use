package UserManagement

import java.io.Serializable;
import org.apache.commons.lang.builder.HashCodeBuilder 

class RoleGroup implements Serializable {
    Role role
    PermissionGroup group
    
    static mapping = {
        id composite: ['role', 'group']
        version: false
        
        cache: 'nonstrict-read-write'
    }
    
    static RoleGroup get(long roleId, long groupId) {
        find 'from RoleGroup where role.id=:roleId and group.id=:groupId', [roleId: roleId, groupId: groupId]
    }
    
    static RoleGroup create(Role role, PermissionGroup group, boolean flush = false, boolean failOnError = false) {
        new RoleGroup(role: role, group: group).save(flush: flush, insert: true, failOnError: failOnError)
    }
    
    static boolean remove(Role role, PermissionGroup group, boolean flush = false) {
        RoleGroup instance = RoleGroup.findByRoleAndGroup(role, group)
        instance ? instance.delete(flush: flush) : false
    }
    
    static void removeAll(Role role) {
        executeUpdate 'DELETE FROM RoleGroup WHERE role=:role', [role: role]
    }
    
    static void removeAll(PermissionGroup group) {
        executeUpdate 'DELETE FROM RoleGroup WHERE group=:group', [group: group]
    }
    
    boolean equals(other) {
        if (!(other instanceof RoleGroup)) {
            return false
        }
        
        other.group?.id == group?.id && other.role?.id == role?.id
    }
    
    int hashCode() {
        def builder = new HashCodeBuilder()
        if (group) builder.append(group.id)
        if (role) builder.append(role.id)
        builder.toHashCode()
    }
    
    String toString() {
        return role
    }
}
