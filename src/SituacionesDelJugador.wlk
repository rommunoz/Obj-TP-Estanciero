import Jugador.*
import Dados.*
import Casillero.*
import Tablero.*

//la interfaz de una Situacion seria jugar y moverseSobre

object libre {

	//punto 9
	method jugar(unJugador){	
		const unNumero = unJugador.tirarLibre()		
		self.moverseSobre(unJugador, unNumero) //si sigue libre se mueveSobre los casilleros, sino, solo cae en la prision
	}
	
	method moverseSobre(unJugador, unNumero){
		const casilleros = tablero.casillerosDesdeHasta(unJugador.casilleroActual(), unNumero)
		casilleros.forEach{casillero => casillero.paso(unJugador)}
		unJugador.caerEn(casilleros.last())
	}
	
	method cumplioLaCondena(){ //solo para completar
		 return true
	}
	
	method turnosAPerder() = 0 //solo para completar
}

class Preso {
	var turnosAPerder = 3
	
	method jugar(unJugador) {  
		if (self.cumplioLaCondena()){
			unJugador.salirDePrision()
			unJugador.jugar()
		} else { 
			unJugador.sacoDobles()
			turnosAPerder--
		}
	}
	
	method moverseSobre(unJugador, _unNumero){
		unJugador.caerEn(prision)
	}
	
	method cumplioLaCondena(){
		 return self.turnosAPerder() == 0
	}
	
	method turnosAPerder() = turnosAPerder
}
