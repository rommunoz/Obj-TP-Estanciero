import Jugador.*
import Casillero.*

class Premio inherits Casillero {
	const bono
	//7
	override method cayo(unJugador){
		unJugador.cobrar(bono)
		super(unJugador)
	}
}

const premioGanadero = new Premio (bono = 2500)

object prision inherits Casillero {
	
	//7 si cae solo cambia su posicion
}

object salida inherits Casillero {
	
	override method paso(unJugador){
		unJugador.cobrar(5000)
	}
	
	//7 solo cambia su posicion
}
	

