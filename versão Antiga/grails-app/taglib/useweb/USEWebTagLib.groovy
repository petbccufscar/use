package useweb

class USEWebTagLib {
    def grailsAttributes
    
    static namespace = "c"
    
    def renderFilter = { attrs, body ->
        out << "<form method='POST' action='${createLink(action: attrs.action ?: 'list', params: [sort: params.sort ?: '', order: params?.order ?: ''])}'>"
        out << "    <div class='input-append'>"
        out << "        <input type='text' name='filter' placeholder='${message(code: 'default.filter.label')}' value='${params.filter ?: ''}' class='span5' />"
        out << "        <span class='add-on'><i class='icon-search'></i></span>"
        out << "    </div>"
        out << body()
        out << "</form>"
    }
    
    def loggedInUserInfo = { attrs, body ->
        def user = UserManagement.User.findByUsername(sec.loggedInUserInfo(field: "username"))
        out << (user && attrs.field ? user."${attrs.field}" : "")
    }
}
