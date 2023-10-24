import Casillero.* 
import Banco.* 

class Propiedad inherits Casillero {
	
	var property duenio = banco
	const precioInicial
	
	method pagarA(){ // accionSegunCasillero()?
	}
	
	//4
	method rentaPara(jugadorQueCayo)
	
	//7
	override method cayo(unJugador){
		duenio.accionDeTitularSobrePropiedad(unJugador, self)
		super(unJugador)
	}
}
