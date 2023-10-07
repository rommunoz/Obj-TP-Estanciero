import Dados.*
import Acreedor.*
import Excepciones.*
import Empresas.*

class Jugador inherits Acreedor {
	//var casilleroActual
	var susDados = new Dados()

	method jugar(){
		const unNumero = self.tirarDados()
		self.avanzar(unNumero)
	}
	
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
	
	method cayoEn(jugadorQueCayo, miPropiedad){
		jugadorQueCayo.pagarRentaPara(self, miPropiedad)
	}

	method pagarRentaPara(unAcreedor, unaPropiedad){ //no lo pongo en Acreedor porque el banco no cae en casilleros
		self.pagarA(unAcreedor, unaPropiedad.rentaPara(self))
	}

	method avanzar(unNumero){	
	}
}

object banco inherits Acreedor (propiedades = #{empresa1, empresa2, empresa3}) {

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
