import Campo.*
import Jugador.*

class Provincia {
	const campos = new Set()
	
	//extension 2
	method todosLosCamposEstanSinDuenio(){
		return self.esMonopolioPara(banco)
	}
	
	//1a 
	method dueniosDeCamposV2(){ //alternativa: copiarlos y agregarlos a un set
		const duenios = #{}
		self.campos().forEach{campo => duenios.add(campo.duenio())}
		return duenios
	}
	
	method dueniosDeCampos(){ //map de campos y luego devolverlo como set
		return self.dueniosConRepetidos().asSet()
	}
	
	method dueniosConRepetidos(){
		return self.campos().map{campo => campo.duenio()}
	}
	
	//1b
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
