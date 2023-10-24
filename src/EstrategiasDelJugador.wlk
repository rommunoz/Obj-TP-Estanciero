import Juego.*

object standard {
	method quiereComprar(_unaPropiedad, _unJugador){
		return true
	}
}

object garca {
	method quiereComprar(unaPropiedad, unJugador){
		return unaPropiedad.cumpleRequisitosDe(self, unJugador) //paso el self?
	}
	
	method cumpleRequisitosElCampo(unCampo, unJugador, unaProvincia){ //creo que se descarta
		return unaProvincia.hayOtroDuenio(unJugador, unCampo)
	}
	
	method cumpleRequisitosLaEmpresa(_unaEmpresa, unJugador){
		return //unJuego.hayOtroEmpresarioAdemasDe(unJugador)
	}
}

object imperialista {
	method quiereComprar(unaPropiedad, unJugador){
		return unaPropiedad.cumpleRequisitosDe(self, unJugador) 
	}
	
	method cumpleRequisitosElCampo(unCampo, unJugador, unaProvincia){
		return unJugador.tieneUnCampoEn(unaProvincia) or
				 unaProvincia.todosLosCamposEstanSinDuenio()
	}
	
	method cumpleRequisitosLaEmpresa(_unaEmpresa, unJugador){
		return // !(unJuego.hayOtroEmpresarioAdemasDe(unJugador))
	}
}
