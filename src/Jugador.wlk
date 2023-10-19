import Dados.*
import Acreedor.*
import Excepciones.*
import Empresas.*
import Casilleros.*
import Tablero.*

class Jugador inherits Acreedor {
	
	const susDados = new Dados()
	var property casilleroActual = salida //punto 8

	//punto 9
	method jugar(unTablero){
		const unNumero = self.tirarDados()
		const casilleros = unTablero.casillerosDesdeHasta(self.casilleroActual(), unNumero)
		self.moverseSobre(casilleros)
	}
	//-
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
	
	method tirarDados(){
		return susDados.tirar(self)
	}
	
	method volverATirar(){
		return susDados.tirarDadosSinValidarPrision()
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
	method avanzar(unNumero){	
	}
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
