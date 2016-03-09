package linhasdecuidado


class LinhadeCuidadoArea {

    static belongsTo = [linhadecuidado:LinhaDeCuidado, area:Area]
    static hasMany = [lcareasubarea:LCAreaSubArea]
    
    static	mapping = {
    }
    
	static	constraints = {
    }
	
}
