package prototipo.grails

class TemplateController {
    //------Telas Comuns------//
    def login() {

    }

    def buscarUsuario() {
        info
    }

    def realizarAGrupo() {
        info
    }

    def buscarAGrupo() {
        info
    }

    //------Professor------//

    static Professor = [Nome       : "Nome do Professor",
                        NCadastro  : "111111",
                        NProntuario: "222222",
                        TipoUsuario: "Professor",
                        Status     : "Ativo"]

    def home_professor() {
        Professor
    }

    def dadosCadastrais_professor() {
        Professor
    }


    def atendimentosPendentes() {
        Professor
    }

    //-----Auno-----//
    static Aluno = [Nome       : "Nome do Aluno",
                    NCadastro  : "111111",
                    NProntuario: "222222",
                    TipoUsuario: "Aluno",
                    Status     : "Ativo"]
    def home_aluno()
    {
        Aluno
    }
}
