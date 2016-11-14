package use

class TemplateController {

    // Usuario fictício para auxiliar no controle do que será mostrado ou não
    static user = [nome:"Nome Default", tipo: "Tipo Default"]

    def login() {

    }

    def home() {

        if (params.user == "professor"){

            user.nome = "Nome do Professor"
            user.tipo = "professor"

            render view: 'home_professor', model: user
        }
        else if (params.user == "aluno"){

            user.nome = "Nome do Aluno"
            user.tipo = "aluno"

            render view: 'plainPage', model: user
        }
        else {
            render view:'plainPage', model: user
        }
    }

    def atividades() {
        user
    }

    def atendimentoIndividual() {
        user
    }

    def atendimentoGrupo() {
        render view:'plainPage', model: user

    }

    def atendimentosPendentes() {
        render view:'plainPage', model: user

    }



//    def realizarAGrupo() {
//
//    }
//
//    def buscarAGrupo() {
//
//    }

    def dadosCadastrais() {

        if(user.tipo == 'professor'){
            render view: 'dadosCadastrais_professor', model: user
        }
        else if(user.tipo == 'aluno'){
//            render view: 'dadosCadastrais_aluno', model: user
            render view: 'plainPage', model: user

        }
        else {
            render view: 'plainPage', model: user
        }

    }

    //------ Professor ------//
    def home_professor() {
        user
    }

    def dadosCadastrais_professor() {
        user
    }

    //------ Aluno ------//
    def home_Aluno() {
        user
    }

    def dadosCadastrais_aluno() {
        user
    }

}
