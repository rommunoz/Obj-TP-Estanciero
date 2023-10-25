import Casillero.* 
import Banco.* 

class Propiedad inherits Casillero {
	
	var property duenio = banco
	const property precioInicial
	
	//4
	method rentaPara(jugadorQueCayo)
	
	//7
	override method cayo(unJugador){
		duenio.accionDeTitularSobrePropiedad(unJugador, self)
		super(unJugador)
	}
	
	//ext2
	method cumpleRequisitosDe(unaEstrategia)
}
