package use

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "template", action: "login")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
