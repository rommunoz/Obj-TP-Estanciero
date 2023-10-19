class Dados {
	var habiaSacadoDoble = false
	
	method tirar(unJugador){
		const dado1 = self.tirarDado()
		const dado2 = self.tirarDado()
		if (dado1 == dado2){
			if (self.validarPrision()) 
				self.mandarAPrision(unJugador)
		} else {
			self.resetearDoble()
		}
		return dado1 + dado2
	}
	
	method tirarDadosSinValidarPrision(){
		return self.tirarDado() + self.tirarDado()
	}
	
	method tirarDado(){
		return 1.randomUpTo(7).truncate(0)
	}
	
	method validarPrision(){
		return habiaSacadoDoble
	}
	
	method mandarAPrision(unJugador){
		unJugador.marchePreso()
		self.resetearDoble()
	}
	
	method resetearDoble(){
		habiaSacadoDoble = false
	}
}
