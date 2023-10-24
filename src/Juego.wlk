import Tablero.*
import Empresa.*

object juego {
	const property jugadores = []
	
	var property estaTerminado = false
	
	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach { jugador => self.queJuegue(jugador) }
		}
	}
	
	method queJuegue(unJugador) {
		unJugador.jugar()
	}
}
