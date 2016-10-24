package UserManagement

class Role {
    String category
    String authority
    String description
    
    static constraints = {
        category(nullable: false, maxSize: 120)
        authority(nullable: false, unique: true, maxSize: 120)
        description(maxSize: 240)
    }
    
    static mapping = {
        cache: 'nonstrict-read-write'
        sort: 'authority'
    }
    
    static def getCategories() {
        // Group Roles by category
        def categories = new TreeMap()
        
        def c = [ compare:
            { a, b -> a.description.compareTo(b.description) }
        ] as Comparator
        
        Role.list().each { role ->
            if (!categories.containsKey(role.category)) {
                categories[role.category] = new TreeSet(c)
            }
            
            // Adds the role to the map
            categories[role.category] << role
        }
        
        return categories
    }
    
    String toString() {
        return description
    }
}
