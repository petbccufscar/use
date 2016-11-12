package use

class TemplateController {

    def login() {

    }

    def buscarUsuario() {

    }

    def realizarAGrupo() {

    }

    def buscarAGrupo() {

    }

    //------Professor------//

    static Professor = [Nome       : "<Nome do Professor>",
                        NCadastro  : "111111",
                        NProntuario: "222222",
                        TipoUsuario: "Professor",
                        Status     : "Ativo"]

    def home() {

        if (params.user == "professor"){
            render view: 'home', model: Professor
        }
        else if (params.user == "aluno"){
            render view: 'home', model: [Nome:"Aluno"]
        }
    }

    def dadosCadastrais_professor() {
        Professor
    }


    def atendimentosPendentes() {
        Professor
    }

}
