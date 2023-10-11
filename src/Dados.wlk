class Dados {
	var vecesQueSacoDoble = 0
	
	method tirar(unJugador){
		const dado1 = self.tirarDado()
		const dado2 = self.tirarDado()
		if (dado1 == dado2) vecesQueSacoDoble++ else self.resetearDoble()
		if (self.validarPrision()) 
			self.mandarAPrision(unJugador)
		return dado1 + dado2
	}
	
	method tirarDadosSinValidarPrision(){
		return self.tirarDado() + self.tirarDado()
	}
	
	method tirarDado(){
		return 1.randomUpTo(7)
	}
	
	method validarPrision(){
		return vecesQueSacoDoble >= 2
	}
	
	method mandarAPrision(unJugador){
		unJugador.marchePreso()
		self.resetearDoble()
	}
	
	method resetearDoble(){
		vecesQueSacoDoble = 0
	}
}
