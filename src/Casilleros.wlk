import Jugador.*

class Propiedad {
	
	var duenio = banco
	const precioInicial
	
	method pagarA(){ // accionSegunCasillero()?
	}
	
	method rentaPara(jugadorQueCayo)
	method sosEmpresa()
	
	method paso(_unJugador){
		//no sucede nada
	}
	
	method cayo(unJugador){
		duenio.cayoEn(unJugador, self)
	}
	
	method duenio(){
		return duenio
	}
	
	method precioInicial(){
		return precioInicial
	}
}

class Premio {
	
	method paso(_unJugador){
		//no sucede nada
	}
}

object salida {
	
	method paso(unJugador){
		unJugador.cobrar(5000)
	}
}