import Excepciones.*

class Acreedor {
	var dinero = 0
	const propiedades = #{}
	
	method pagarA(unAcreedor, unMonto){
		if(!self.puedePagar(unMonto)) throw noLoPuedePagar
		self.pagar(unMonto)
		unAcreedor.cobrar(unMonto)
	}
	
	method puedePagar(unMonto) {
		return dinero >= unMonto
	}
	
	method pagar(unMonto){
		self.modificarDinero(-unMonto)
	}
	
	method cobrar(unMonto){
		self.modificarDinero(unMonto)
	}
	
	method modificarDinero(unMonto){
		dinero += unMonto
	}
	
	method cantidadDeEmpresas(){
		return self.empresas().size()
	}
	
	method propiedades(){
		return propiedades
	}
	
	method empresas(){
		return self.propiedades().filter{unaPropiedad => unaPropiedad.sosEmpresa()}
	}
	
	method dinero(){
		return dinero
	}
}
