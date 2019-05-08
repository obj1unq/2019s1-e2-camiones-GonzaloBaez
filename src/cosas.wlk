object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	const pesoDeLadrillo = 2
	var property cantDeLadrillos = 1
	
	method peso(){
		return pesoDeLadrillo * cantDeLadrillos
	}
	method nivelPeligrosidad(){
		return 2
	}
}

object arenaAGranel{
	var property peso = 0
	
	method nivelPeligrosidad(){
		return 1
	}
}

object bateriaAntiaerea{
	var tieneMisiles = false
	
	method sacarMisiles(){
		tieneMisiles = false
	}
	method ponerMisiles(){
		tieneMisiles = true
	}
	
	method peso(){
		return if (tieneMisiles) {300} else {200}
	}
	
	method nivelPeligrosidad(){
		return if (tieneMisiles) {100} else {0}
	}
}

object contenedorPortuario{
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	
	method peso(){
		return 100 + cosas.sum({cosa => cosa.peso()})
	}
	method nivelPeligrosidad(){
		return if (cosas.isEmpty()) {0} else {self.nivelDePeligrosidadMaximo()}
	}
	method nivelDePeligrosidadMaximo(){
		return cosas.map{cosa => cosa.nivelPeligrosidad()}.max()
	}
}

object embalajeDeSeguridad{
	var property cosaDentro = paqueteDeLadrillos
	
	method peso(){
		return cosaDentro.peso()
	}
	method nivelPeligrosidad(){
		return cosaDentro.nivelPeligrosidad()/2
	}
}














