import Casilleros.*
import Jugador.*  
import Excepciones.*  

class Campo inherits Propiedad {
	const provincia
	const valorDeRentaFijo
	const costoDeEstancia 
	var cantidadDeEstancias = 0
	
	
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
	
	override method sosEmpresa(){
		return false
	}
	
	override method rentaPara(_jugadorQueCayo){
		return (2 ** cantidadDeEstancias) * valorDeRentaFijo  
	}
	
}

class Empresa inherits Propiedad {
	
	override method sosEmpresa(){
		return true
	}
	
	override method rentaPara(jugadorQueCayo){
		const numero = jugadorQueCayo.volverATirar()
		return numero * 30000 * duenio.cantidadDeEmpresas()
	}
}