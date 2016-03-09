package UserManagement

class PersistentLogin {
    static transients = ['series']
    
    String id
    String username
    String token
    Date lastUsed
    
    static constraints = {
        id(maxSize: 64)
        username(maxSize: 64)
        token(maxSize: 64)
    }
    
    static mapping = {
        table: 'persistent_logins'
        id column: 'series', generator: 'assigned'
        version: false
    }
    
    void setSeries(String series) {
        id = series
    }
    
    String getSeries() {
        return id
    }
}
