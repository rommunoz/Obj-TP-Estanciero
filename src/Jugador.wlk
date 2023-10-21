import Dados.*
import Acreedor.*
import Excepciones.*
import Empresas.*
import Casilleros.*
import Tablero.*
import SituacionesDelJugador.*

class Jugador inherits Acreedor {
	
	const susDados = new Dados()
	
	var property casilleroActual = salida //punto 8
	var property situacionLegal = new Libre() //ese nombre??) punto 9, (libre juega normal) o preso

	//punto 9
//	method jugar(unTablero){
//		const unNumero = situacionLegal.tirarDados() //TODO: consigo el nro () y cambio (o no) mi situacion
//		situacionLegal.jugar(unTablero, self, unNumero) //TODO: acciono segun situacion, ya tengo nro
//	}

	//punto 9 (extension 1)
	method jugar(unTablero){
		situacionLegal.jugar(unTablero, self) //TODO: acciono segun situacion
	}

	method tirarLibre(){
		return susDados.tirarLibre(self)
	}
	//TODO: analizar si sería mejor tener 1 solo tirarDados que dependa de la situacion, 
		//y cada situacion tendra un DadosParaPreso o DadosParaLibre.
			//ahora bien, si me agregan otro comportamiento mas de tiro, creo que debo hacer esto si o si
	method tirarPreso(unTablero){
		susDados.tirarPreso(self, unTablero)
	}
	
	method moverseSegunSituacion(unTablero, unNumero){
		situacionLegal.moverseSobre(self, unTablero, unNumero)
	}
	//
	
	method marchePreso(){
		situacionLegal = new Preso()
	}
	
	method salirDePrision(unTablero, unNumero){
		situacionLegal = new Libre()
		self.moverseSegunSituacion(unTablero, unNumero)
	}
	
	method cumplioCondena(){
		return situacionLegal.cumplioLaCondena()
	}
	//- fin punto9 ext 1
	
	method comprar(unaPropiedad){ //falta contemplar la compra a otro jugador
		self.pagarA(banco, unaPropiedad.precioInicial())
		self.agregarPropiedad(unaPropiedad)
		unaPropiedad.duenio(self)
	}
	
	method agregarPropiedad(unaPropiedad){
		propiedades.add(unaPropiedad)
	}
	
	method pagarEstancia(unMonto){
		self.pagarA(banco, unMonto)
	}

	
	
	// punto 7
	method cayoEn(jugadorQueCayo, miPropiedad){
		if(jugadorQueCayo != self)
			jugadorQueCayo.pagarRentaPara(self, miPropiedad)
	}

	method pagarRentaPara(unAcreedor, unaPropiedad){ //no lo pongo en Acreedor porque el banco no cae en casilleros
		self.pagarA(unAcreedor, unaPropiedad.rentaPara(self))
	}

	//punto 8 
	method moverseSobre(unosCasilleros){
		unosCasilleros.forEach{casillero => casillero.paso(self)}
		self.caerEn(unosCasilleros.last())
	}

	method caerEn(unCasillero){
		unCasillero.cayo(self)
		self.casilleroActual(unCasillero)
	}
	//-
	
}

object banco inherits Acreedor (propiedades = #{empresa1, empresa2, empresa3}) {

	// punto 7
	method cayoEn(jugadorQueCayo, miPropiedad){
		self.vender(miPropiedad, jugadorQueCayo)
	}
	
	method vender(unaPropiedad, unJugador){
		unJugador.comprar(unaPropiedad)
		self.eliminarPropiedad(unaPropiedad)
	}
	
	method eliminarPropiedad(unaPropiedad){
		self.propiedades().remove(unaPropiedad)
	}
	
}
