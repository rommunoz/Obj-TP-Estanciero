import Propiedades.*
import Jugador.*

class Provincia {
	const campos = new Set()
	
	method dueniosDeCampos(){ //es como copiarlos y agregarlos a un set
		const duenios = #{}
		self.campos().forEach{campo => duenios.add(campo.duenio())}
		return duenios
	}
	
	method dueniosDeCamposV2(){ //alternativa map de campos y luego devolverlo como set
		return self.dueniosConRepetidos().asSet()
	}
	
	method dueniosConRepetidos(){
		return self.campos().map{campo => campo.duenio()}
	}
	
	method agregarCampo(unCampo){
		campos.add(unCampo)
	}
	
	method campos() = campos
	
	method esMonopolioPara(unDuenio){
		return campos.all{unCampo => unCampo.duenio() == unDuenio}
	}
	
	method esConstruccionPareja(nroDeEstanciasDeUnCampo){
		return campos.all{unCampo => unCampo.tieneMenorOIgualEstanciasQue(nroDeEstanciasDeUnCampo)}
	}
	
}
