import Jugador.*

class Casillero {
	//6
	method paso(_unJugador){
		//no sucede nada
	}
	
	method sosEmpresa() = false
	
	//punto 7
	method cayo(unJugador){
		unJugador.cambiarPosicionActualPor(self)
	}
}
