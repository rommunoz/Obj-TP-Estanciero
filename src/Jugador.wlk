import Dados.*
import Excepciones.*

class Jugador {
	var dinero = 0
	var property camposJugador = #{}
	//var empresas = #{}
	//var casilleroActual
	var susDados = new Dados()

	method jugar(){
		const unNumero = self.tirarDados()
		self.avanzar(unNumero)
	}
	
	method pagarA(unAcreedor, unMonto){
		if(!self.puedePagar(unMonto)) throw noLoPuedePagar
		self.disminuirDineroEn(unMonto)
		unAcreedor.aumentarDineroEn(unMonto)
	}
	
	method pagarEstancia(unMonto){
		self.pagarA(banco, unMonto)
	}
	
	method puedePagar(unMonto) {
		return dinero >= unMonto
	}
	
	method disminuirDineroEn(unMonto){
		self.modificarDinero(-unMonto)
	}
	
	method aumentarDineroEn(unMonto){
		self.modificarDinero(unMonto)
	}
	
	method modificarDinero(unMonto){
		dinero += unMonto
	}
	
	method tirarDados(){
		return susDados.tirar()
	}
	
	method avanzar(unNumero){
		
	}
	
	method dinero(){
		return dinero
	}
	
//	method cantidadDeEmpresas(){
//		return empresas.size()
//	}
	
}

object banco {
	
	method pagarA(unAcreedor, unMonto){
		unAcreedor.aumentarDineroEn(unMonto)
	}
	
	method disminuirDineroEn(_unMonto) {
	}
	
	method puedePagar(_unMonto) {
		return true
	}
	
    method aumentarDineroEn(_unMonto) {
	}
}
