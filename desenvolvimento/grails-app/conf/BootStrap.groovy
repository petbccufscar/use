import UserManagement.*
import useweb.*
import linhasdecuidado.LinhaDeCuidado
import linhasdecuidado.Area
import linhasdecuidado.SubArea
import linhasdecuidado.Acao
import linhasdecuidado.Procedimento


class BootStrap {

    def grailsApplication

    def springSecurityService
    
    def init = { servletContext ->
        
        if(LinhaDeCuidado.findAll().isEmpty()) {
            println "populando linhas de cuidado"
            def linhasdecuidado = new File("LinhasDeCuidado/linhas de cuidado.txt")
            linhasdecuidado.eachLine { line ->
                def ldc = line
                new LinhaDeCuidado(nome: ldc).save(flush: true)                
            }
        }
        
        if(Colaborador.findAll().isEmpty()){
            println "populando colaboradores"
            def colaboradores = new File("outros/colaboradores.txt")
            colaboradores.eachLine { line ->
                def colab = line
                new Colaborador(nome: colab).save(flush: true)                
            }
        }
        
        new Campus(nome:'UFSCar - São Carlos').save(flush:true)
        
        if(Departamento.findAll().isEmpty()) {
            println "populando departamentos"
            def departamentosSC = new File("departamentos/departamentos_sao_carlos.txt")
            departamentosSC.eachLine { line ->
                def dpto = line
                new Departamento(campus:[id:1], nome: dpto).save(flush: true)                
            }
        }
        
        
        
       
        new Area(nome:'aaaa').save(flush:true)
        new Area(nome:'aaaa2').save(flush:true)
        new Area(nome:'aaaa3').save(flush:true)
        new SubArea(nome:'bbbb').save(flush:true)
        new SubArea(nome:'bbbb2').save(flush:true)
        new SubArea(nome:'bbbb3').save(flush:true)
     /*   
        if(TipoAcao.findAll().isEmpty()) {
            println "populando tipos de acao"
            def tipos = new File("LinhasDeCuidado/tipos de acao.txt")
            tipos.eachLine { line ->
                def tipo = line
                new TipoAcao(nome: tipo).save(flush: true)                
            }
        }
        
        if(Procedimento.findAll().isEmpty()) {
            println "populando procedimentos"
            int i = 0;
            def procedimentos = new File("LinhasDeCuidado/procedimentos.txt")
            procedimentos.eachLine { line ->
                def procedimento = line
                new Procedimento(nome: procedimento, codigo: i++).save(flush: true)                
            }
        }
       */ 
      /*
        if(Cidade.findAll().isEmpty()) {
            println "populando cidades"
            def cidades = new File("cidades.txt")
            cidades.eachLine { line ->
                def cidade = line.split(",")
                new Cidade(estado: cidade[0], nome: cidade[1]).save(flush: true)
            }
        }
        */
       
        if(EnderecoConsulta.findAll().isEmpty()) {
            println "populando enderecos"
            def enderecos = new File("outros/CEP_SAO_CARLOS.txt")
            enderecos.eachLine { line ->
                def endereco = line.split(";")
                new EnderecoConsulta(
                    cep: endereco[0],
                    tipoLogradouro: endereco[1],
                    logradouro: endereco[2],
                    bairro: endereco[3], 
                    estado: endereco[4],
                    cidade: endereco[5]
                ).save(flush: true)
            }
        }
        
            println "populando origem"
            new Origem(nome: "Unicep").save(flush: true)
            new Origem(nome: "Prefeitura").save(flush: true)
            new Origem(nome: "Empresa Privada").save(flush: true)
            new Origem(nome: "Outro").save(flush: true)
    
        
        // Update roles
        updateRoles()
        
        // Create admin User
        def user = User.findOrSaveWhere(
            userRealName: "PROGRAMA DE EDUCAÇÃO TUTORIAL",
            username: "adm",
            password: "p3t",
            email: "petbcc@dc.ufscar.br",
            system: true
        )
        
        // Create admin Permission Group
        def permissionGroup = PermissionGroup.findOrSaveWhere(
            name: "ADMINISTRADORES",
            system: true
        )
        
        def actualRoles = Role.executeQuery("select distinct role.id from Role role")
        def actualUsers = UserGroup.executeQuery("select distinct userGroup.user.id from UserGroup userGroup where userGroup.group.id = (:permissionGroup)", [permissionGroup: permissionGroup.id])
        if (actualUsers.size == 0) {
            actualUsers.add(1)
        }
        
        permissionGroup.saveWithRelationships(actualRoles, actualUsers)
    }
    def destroy = {
    }
    
    def updateRoles() {
        Role.withTransaction { status ->
            // Creates all the roles of the system, locking for the 'roles' property on controller classes
            
            // First, get all existing roles
            def existingRoles = Role.createCriteria().list {
                projections {
                    property("authority")
                }
            }
            
            // Now, update the roles in use by the system
            grailsApplication.controllerClasses.each { controllerClass ->
                if (controllerClass.hasProperty("roles")) {
                    controllerClass.getPropertyValue("roles").each { role ->
                        def roleAuthority = "ROLE_${controllerClass.logicalPropertyName.toUpperCase()}_${role.toUpperCase()}".toString()
                        
                        if (!existingRoles.contains(roleAuthority)) {
                            // Saves the new Role if it does not exist
                            new Role(
                                category: "role.${controllerClass.logicalPropertyName}",
                                authority: roleAuthority,
                                description: "role.${controllerClass.logicalPropertyName}.${role.toLowerCase()}"
                            ).save(failOnError: true)
                        } else {
                            // If the the role exists, removes it from the existingRoles list, as this list will
                            // be used to remove roles not in use anymore
                            existingRoles -= roleAuthority
                        }
                    }
                }
            }
            
            // Create RuntimeLogging Role
            Role.findOrSaveWhere(
                category: "role.runtimeLogging",
                authority: "ROLE_RUNTIMELOGGING_EDIT",
                description: "role.runtimeLogging.edit"
            )
            
            // Removes non used roles from the database
            // Removes the RoleGroup relationships
            if (existingRoles?.size() > 0) {
                def roleGroupIds = RoleGroup.executeQuery(
                    "select distinct rg.id from RoleGroup as rg, Role as r where rg.role.id = r.id and r.authority in (:authorityList)", [authorityList: existingRoles]
                )
                if (roleGroupIds?.size() > 0) {
                    RoleGroup.executeUpdate("delete from RoleGroup as rg where rg.id in (:roleGroupIds)", [roleGroupIds: roleGroupIds])
                }
                
                // Remove the Roles
                Role.executeUpdate("delete from Role as r where r.authority in (:authorityList)", [authorityList: existingRoles])
            }
        }
    }
}
