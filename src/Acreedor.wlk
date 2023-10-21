import Excepciones.*

class Acreedor {
	var dinero = 0
	const propiedades = new Set()
	
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
	
	method cantidadDeEmpresas() = self.empresas().size()
	
	method propiedades() = propiedades
	
	method empresas(){
		return self.propiedades().filter{unaPropiedad => unaPropiedad.sosEmpresa()}
	}
	
	method dinero() = dinero
}
