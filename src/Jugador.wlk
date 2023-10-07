import Dados.*
import Acreedor.*
import Excepciones.*
import Empresas.*

class Jugador inherits Acreedor {
	const property camposJugador = #{}
	//var casilleroActual
	var susDados = new Dados()

	method jugar(){
		const unNumero = self.tirarDados()
		self.avanzar(unNumero)
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

	method avanzar(unNumero){	
	}
}

object banco inherits Acreedor (empresas = #{empresa1, empresa2, empresa3}) {
	
}
