import Dados.*
import Acreedor.*
import Excepciones.*
import Banco.*
import Empresa.*
import CasillerosEspeciales.*
import Tablero.*
import Propiedad.*
import SituacionesDelJugador.*
import EstrategiasDelJugador.*

class Jugador inherits Acreedor {
	
	//const susDados = new Dados()
	
	var property casilleroActual = salida //punto 8
	var property situacionLegal = new Libre() //ese nombre??) extension (libre juega normal) o preso
	var property estrategiaDeCompra = standard

	//1b
	method pagarEstancia(unMonto){
		self.pagarA(banco, unMonto)
	}
	
	//2b en Acreedor
	
//	method tirarDados(){
//		return susDados.tirar(self)
//	}
	
	//3 
	method tirarDados(){ //solo se obtiene el numero
		return self.tirarDado() + self.tirarDado()
	}
	
	method tirarDado(){
		return 1.randomUpTo(7).truncate(0)
	}
	//TODO: analizar si sería mejor tener 1 solo tirarDados que dependa de la situacion, 
		//y cada situacion tendra un DadosParaPreso o DadosParaLibre.
			//ahora bien, creo que solo debo hacer esto si me agregan otro comportamiento mas de tiro

	
	//5
//	override method pagarA(unMonto, unAcreedor){
//		if(!self.puedePagar(unMonto)) {
//			self.hipotecarUnaPropiedad()
//			self.pagarA(unMonto, unAcreedor)
//		}
//		self.pagar(unMonto)
//		unAcreedor.cobrar(unMonto)
//	}

//	method hipotecarUnaPropiedad(){
//		if (self.propiedades().isEmpty()) throw 
//	}
	//
	
	//7
	override method accionDeTitularSobrePropiedad(jugadorQueCayo, miPropiedad){
		if(not (self === jugadorQueCayo)){
			jugadorQueCayo.pagarRentaPara(self, miPropiedad)
		}
	}

	method pagarRentaPara(unAcreedor, unaPropiedad){ //no lo pongo en Acreedor porque el banco no cae en casilleros
		self.pagarA(unAcreedor, unaPropiedad.rentaPara(self))
	}
	
	method cambiarPosicionActualPor(unCasillero){
		casilleroActual = unCasillero
	}

	method comprar(unaPropiedad){ //falta contemplar la compra a otro jugador
		self.pagarA(banco, unaPropiedad.precioInicial())
		self.agregarPropiedad(unaPropiedad)
		banco.eliminarPropiedad(unaPropiedad)
	}
	
	method agregarPropiedad(unaPropiedad){
		propiedades.add(unaPropiedad)
		unaPropiedad.duenio(self)
	}

	//8 
	method moverseSobre(unosCasilleros){
		unosCasilleros.forEach{casillero => casillero.paso(self)}
		self.caerEn(unosCasilleros.last())
	}

	method caerEn(unCasillero){
		unCasillero.cayo(self)
	}
	
	//9
//	method jugar(){
//		const unNumero = self.tirarDados() //consigo el nro () y cambio (o no) mi situacion
//		const casilleros = tablero.casillerosDesdeHasta(self.casilleroActual(), unNumero)
//		self.moverseSobre(casilleros) // acciono segun situacion, ya tengo nro
//	}

//	//punto 9 (extension 1)
	method jugar(){
		const dado1 = self.tirarDado()		
		const dado2 = self.tirarDado()
		situacionLegal.evaluarSituacion(self, dado1, dado2) // evalúa si cambiar de situacion
		situacionLegal.jugarHabiendoTirado(self, dado1 + dado2) //TODO: acciono segun mi situacion
	}

	method marchePreso(){
		self.caerEn(prision)
		self.situacionLegal(new Preso())
	}
	
	method salirDePrision(){
		self.situacionLegal(new Libre())
	}

	//- fin punto9 ext 1
	
	//ext2
	method comprarSi(unaPropiedad){
		if(self.quiereComprar(unaPropiedad)) self.comprar(unaPropiedad)
	}
	
	method quiereComprar(unaPropiedad){
		return estrategiaDeCompra.esRentable(unaPropiedad, self)
	}
	
	method tieneAlMenosUnaEmpresa(){
		return self.cantidadDeEmpresas() > 0
	}
	
	method tieneUnCampoEn(unaProvincia){
		return self.campos().any{campo => campo.provincia() == unaProvincia}
	}
	
}