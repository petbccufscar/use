package UserManagement

import java.io.Serializable;
import org.apache.commons.lang.builder.HashCodeBuilder 

class UserGroup implements Serializable {
    User user
    PermissionGroup group
    
    static mapping = {
        id composite: ['user', 'group']
        version: false
        
        cache: 'nonstrict-read-write'
    }
    
    static UserGroup get(long userId, long groupId) {
        find 'from UserGroup where user.id=:userId and group.id=:groupId', [userId: userId, groupId: groupId]
    }
    
    static UserGroup create(User user, PermissionGroup group, boolean flush = false, boolean failOnError = false) {
        new UserGroup(user: user, group: group).save(flush: flush, insert: true, failOnError: failOnError)
    }
    
    static boolean remove(User user, PermissionGroup group, boolean flush = false) {
        UserGroup instance = UserGroup.findByUserAndGroup(user, group)
        instance ? instance.delete(flush: flush) : false
    }
    
    static void removeAll(User user) {
        executeUpdate 'DELETE FROM UserGroup WHERE user=:user', [user: user]
    }
    
    static void removeAll(PermissionGroup group) {
        executeUpdate 'DELETE FROM UserGroup WHERE group=:group', [group: group]
    }
    
    boolean equals(other) {
        if (!(other instanceof UserGroup)) {
            return false
        }
        
        other.group?.id == group?.id && other.user?.id == user?.id
    }
    
    int hasCode() {
        def builder = new HashCodeBuilder()
        if (group) builder.append(group.id)
        if (user) builder.append(user.id)
        builder.toHashCode()
    }
    
    String toString() {
        return this?.group
    }
}
