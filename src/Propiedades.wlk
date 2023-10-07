import Casilleros.*
import Jugador.*  
import Excepciones.*  

class Campo inherits Propiedad {
	const provincia
//	const valorDeRentaFijo
	const costoDeEstancia 
	var cantidadDeEstancias = 0
	
//	method rentaSegunEstanciasConstruidas(){
//		return 2 ** cantidadDeEstanciasConstruidas * valorDeRentaFijo  
//	}
	
	method agregarUnaEstancia(){
		if (!provincia.esMonopolioPara(duenio)) throw noMonopolio
		if (!self.esConstruccionPareja()) 		throw noConstruccionPareja
		duenio.pagarEstancia(costoDeEstancia) // está bien pasarlo así sin el getter?
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
	
}

class Empresa inherits Propiedad {
	
	override method pagarA(){
		
	}
}