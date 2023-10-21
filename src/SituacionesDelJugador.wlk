import Jugador.*
import Dados.*
import Casilleros.*

//la interfaz de una Situacion seria jugar y moverseSobre

class Libre {

	//punto 9
	method jugar(unTablero, unJugador){	
		const unNumero = unJugador.tirarLibre()		
		unJugador.moverseSegunSituacion(unTablero, unNumero) //si sigue libre se mueveSobre los casilleros, sino, solo cae en la prision
	}
	
	method moverseSobre(unJugador, unTablero, unNumero){
		const casilleros = unTablero.casillerosDesdeHasta(unJugador.casilleroActual(), unNumero)
		casilleros.forEach{casillero => casillero.paso(unJugador)}
		unJugador.caerEn(casilleros.last())
	}
}

class Preso {
	var turnosAPerder = 3
	
	method jugar(_unTablero, unJugador) {  
		const unNumero = unJugador.tirarPreso()
		turnosAPerder--
	}
	
	method moverseSobre(unJugador, _unTablero, _unNumero){
		unJugador.caerEn(prision)
	}
	
	method cumplioLaCondena(unJugador){
		 return self.turnosAPerder() == 0
	}
	
	method turnosAPerder() = turnosAPerder
}
