import Jugador.*
import Dados.*
import Casillero.*
import Tablero.*
import CasillerosEspeciales.*

//TODO: por eso no se si hacer una superclase con solo los metodos de jugar y evaluar
class Libre {
	
	var property habiaSacadoDoble = false //ext1, elegí ponerlo aca como un dato cache y 
											// no en el jugador porque solo se controla al estar libre
	//ext 1
	method jugarHabiendoTirado(unJugador, unNumero){			
		const casilleros = tablero.casillerosDesdeHasta(unJugador.casilleroActual(), unNumero)
		unJugador.moverseSobre(casilleros)
	}
	
	method evaluarSituacion(unJugador, dado1, dado2){
		if (dado1 == dado2 and self.habiaSacadoDoble()) 
			unJugador.marchePreso()
		self.habiaSacadoDoble(dado1 == dado2) //al ir preso este seteo queda sin utilidad (dudoso), pero no se me ocurre otra
	}
}

class Preso {
	var turnosAPerder = 3
	
	method jugarHabiendoTirado(_unJugador, _valorDeLosDados) {  
		turnosAPerder--
	}
	
	method evaluarSituacion(unJugador, dado1, dado2){
		if (dado1 == dado2 or self.cumplioLaCondena())
			unJugador.salirDePrision()
	}
	
	method cumplioLaCondena(){
		 return self.turnosAPerder() == 0
	}
	
	method turnosAPerder() = turnosAPerder
}
