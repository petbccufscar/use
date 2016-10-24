package linhasdecuidado


class LCAreaSubArea {

    static belongsTo = [linhadecuidadoarea:LinhadeCuidadoArea, subarea:SubArea]
    static hasMany = [Procedimento]
    
    
    
	static	constraints = {
    }
	

}
