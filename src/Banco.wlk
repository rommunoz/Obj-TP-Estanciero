import Acreedor.*
import Empresa.*

object banco inherits Acreedor (propiedades = #{empresa1, empresa2, empresa3}) {

	//extension 3
//	override method pagarA(unAcreedor, unMonto){
//		if(!self.puedePagar(unMonto)) throw noLoPuedePagar
//		self.pagar(unMonto)
//		unAcreedor.cobrar(unMonto)
//	}
	
	//7 algo adelantado
	override method accionDeTitularSobrePropiedad(jugadorQueCayo, miPropiedad){
		//if(jugadorQueCayo.quiereComprar(miPropiedad))
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
