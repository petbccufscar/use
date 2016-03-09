package useweb

import useweb.Colaborador


abstract class Responsavel extends Colaborador {

    static hasMany = [periododeresponsabilidade:PeriodoDeResponsabilidade]
    
    static mapping = {
    tablePerHierarchy false
  }
}
