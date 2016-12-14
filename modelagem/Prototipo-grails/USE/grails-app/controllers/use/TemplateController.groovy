package use

class TemplateController {

    /**Usuario fictício para auxiliar no controle do que será mostrado no browser**/
    static user = [nome:"Nome Default", tipo: "Tipo Default"]

    /**Métodos Genéricos: funciona para mais de um tipo de usuário**/
    def login() {
        render view:'login/login'
    }

    def home() {

        if (params.user == "professor"){

            user.nome = "Nome do Professor"
            user.tipo = "professor"

            return home_professor()
        }
        else if (params.user == "aluno"){

            user.nome = "Nome do Aluno"
            user.tipo = "aluno"

            return home_aluno()
        }
        else {

            render view:'plainPage', model: user
        }
    }

    def atividades() {
        render view:'TelasComuns/atividades', model: user
    }

    def atendimentoIndividual() {
        render view:'TelasComuns/atendimentoIndividual', model: user
    }

    def atendimentoAGrupo() {
        render view:'TelasComuns/atendimentoAGrupo', model: user
    }

    def atendimentoRGrupo() {
        render view:'TelasComuns/atendimentoRGrupo', model: user
    }

    def atendimentosPendentes() {
        render view:'TelasComuns/atendimentosPendentes', model: user
    }

    def questoesPendentes(){
        render view: 'TelasComuns/questoesPendentes', model: user
    }

    def dadosCadastrais() {

        if(user.tipo == 'professor'){
            return dadosCadastrais_professor()
        }
        else if(user.tipo == 'aluno'){
            return dadosCadastrais_aluno()
        }
        else {
            render view: 'plainPage', model: user
        }

    }


    /**Métodos do Professor**/
    def home_professor() {
        render view:'professor/home_professor', model: user
    }

    def dadosCadastrais_professor() {
        render view: 'professor/dadosCadastrais_professor', model: user
    }


    /**Métodos do Aluno**/
    def home_aluno() {
        render view: 'plainPage', model: user
    }

    def dadosCadastrais_aluno() {
        render view: 'aluno/dadosCadastrais_aluno', model: user
    }

    def plainPage(){
        render view: 'plainPage', model: user
    }
}