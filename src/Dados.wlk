class Dados {
	var habiaSacadoDoble = false
	
	//punto 9
	method tirarLibre(unJugador){
		const dado1 = self.tirarDado()
		const dado2 = self.tirarDado()
		if (dado1 == dado2){
			self.validarPrision(unJugador) 
			habiaSacadoDoble = true
		} else {
			self.resetearDoble()
		}
		return dado1 + dado2
	}
	
	method tirarPreso(unJugador){
		const dado1 = self.tirarDado()
		const dado2 = self.tirarDado()
		if (dado1 == dado2 or unJugador.cumplioCondena()){
			unJugador.salirDePrision(dado1 + dado2)
		}
		return dado1 + dado2
	}
	
	//-
	method tirarDadosSinValidarPrision(){
		return self.tirarDado() + self.tirarDado()
	}
	
	method tirarDado(){
		return 1.randomUpTo(7).truncate(0)
	}
	
	method validarPrision(unJugador){
		if (habiaSacadoDoble){
			unJugador.marchePreso()
		}
	}
	
	method resetearDoble(){
		habiaSacadoDoble = false
	}
}
