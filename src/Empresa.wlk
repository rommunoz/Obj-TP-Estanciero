import Propiedad.* 

class Empresa inherits Propiedad {
	
	//2a
	override method sosEmpresa() = true
	
	//4
	override method rentaPara(jugadorQueCayo){
		const numero = jugadorQueCayo.tirarDados()
		return numero * 30000 * duenio.cantidadDeEmpresas()
	}
}

const empresa1 = new Empresa(precioInicial = 10000)
const empresa2 = new Empresa(precioInicial = 20000)
const empresa3 = new Empresa(precioInicial = 30000)
