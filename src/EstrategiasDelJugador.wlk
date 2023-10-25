import Juego.*

object standard {
	method esRentable(_unaPropiedad, _unJugador){
		return true
	}
}

object garca {
	method esRentable(unaPropiedad, unJugador){
		return unaPropiedad.hayOtroDuenioEnTuProvinciaAdemasDe(unJugador)
			or juego.hayOtroEmpresarioAdemasDe(unJugador)
	}
}

object imperialista {
	method esRentable(unaPropiedad, unJugador){
		return unaPropiedad.cumpleRequisitosDe(self, unJugador) 
	}
	
	method cumpleRequisitosElCampo(unCampo, unJugador, unaProvincia){ //tengo mis dudas
		return unJugador.tieneUnCampoEn(unaProvincia) or
				 unaProvincia.todosLosCamposEstanSinDuenio()
	}
	
	method cumpleRequisitosLaEmpresa(_unaEmpresa, unJugador){
		return not juego.hayOtroEmpresarioAdemasDe(unJugador)
	}
}
