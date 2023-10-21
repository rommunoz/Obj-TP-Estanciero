import Jugador.*

class Propiedad {
	
	var property duenio = banco
	const precioInicial
	
	method pagarA(){ // accionSegunCasillero()?
	}
	
	method rentaPara(jugadorQueCayo)
	method sosEmpresa()
	
	//punto 6
	method paso(_unJugador){
		//no sucede nada
	}
	
	//punto 7
	method cayo(unJugador){
		duenio.cayoEn(unJugador, self)
	}
	
	method precioInicial(){
		return precioInicial
	}
}

class Premio {
	
	const bono
	
	method paso(_unJugador){
		//no sucede nada
	}
	
	//punto 7
	method cayo(unJugador){
		unJugador.cobrar(bono)
	}
}

const premioGanadero = new Premio (bono = 2500)

object prision {
	
	method paso(unJugador){
		//no sucede nada
	}
	
	method cayo(_unJugador){
		//no sucede nada
	}
}

object salida {
	
	method paso(unJugador){
		unJugador.cobrar(5000)
	}
	
	//punto 7
	method cayo(_unJugador){
		//no sucede nada
	}
}