import Casillero.*
import Jugador.*  
import Excepciones.*  
import Propiedad.*  

class Campo inherits Propiedad {
	const property provincia
	const valorDeRentaFijo
	const costoDeEstancia 
	var cantidadDeEstancias = 0
	
	
	//1b
	method construirEstancia(){
		if (!provincia.esMonopolioPara(duenio)) throw noMonopolio
		if (!self.esConstruccionPareja()) 		throw noConstruccionPareja
		duenio.pagarEstancia(costoDeEstancia) // está bien pasarlo así sin el getter
		self.agregarUnaEstancia()
	}
	
	method agregarUnaEstancia() {
		cantidadDeEstancias++
	}
	
	method esConstruccionPareja(){
		return provincia.esConstruccionPareja(cantidadDeEstancias)
	}

	method tieneMenorOIgualEstanciasQue(unNroDeEstanciasConstruidas){
		return cantidadDeEstancias <= unNroDeEstanciasConstruidas
	}
	
	method cantidadDeEstancias(){
		return cantidadDeEstancias
	}
	
	//2a
	override method sosEmpresa() = false
	
	//4
	override method rentaPara(_jugadorQueCayo){
		return (2 ** cantidadDeEstancias) * valorDeRentaFijo  
	}
	
	//extension 2
	method cumpleRequisitosDe(unaEstrategia, unJugador){
		return unaEstrategia.cumpleRequisitosElCampo(self, unJugador, self.provincia())
	}
	//
}