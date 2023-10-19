import Tablero.*

class Juego {
	const jugadores = []
	const property tablero = new Tablero()
	
	var property estaTerminado = false
	
	method empezar() {
		if (not self.estaTerminado()) {
			jugadores.forEach { jugador => self.queJuegue(jugador) }
		}
	}
	
	method queJuegue(unJugador) {
		unJugador.jugar(self.tablero())
	}
}
