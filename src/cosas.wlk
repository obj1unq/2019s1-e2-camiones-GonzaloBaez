object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantBulto(){return 1}
	method producirCambio(){
		
	}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method transformadoEnAuto(){return transformadoEnAuto}
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method cantBulto(){return 2}
	method producirCambio(){
		if (transformadoEnAuto) {self.transformar()} else {}
	}
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
	method cantBulto() {
		return if (cantDeLadrillos <= 100) {1} else if (cantDeLadrillos <= 300) {2} else {3}
		
	}
	method producirCambio(){
		cantDeLadrillos += 12
	}
}

object arenaAGranel{
	var property peso = 0
	
	method nivelPeligrosidad(){
		return 1
	}
	method cantBulto(){return 1}
	method producirCambio(){
		peso += 20
	}
}

object bateriaAntiaerea{
	var tieneMisiles = false
	
	method tieneMisiles(){
		return tieneMisiles
	}
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
	method cantBulto() {
		return if (tieneMisiles) {2} else {1}
		
	}
	method producirCambio(){
		self.ponerMisiles()
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
	method cantBulto() {
		return 1 + cosas.size()
		
	}
	method producirCambio(){
		cosas.forEach {cosa => cosa.producirCambio()}
	}
}

object embalajeDeSeguridad{
	var property cosaDentro = paqueteDeLadrillos
	
	method cantBulto(){return 2}
	method peso(){
		return cosaDentro.peso()
	}
	method nivelPeligrosidad(){
		return cosaDentro.nivelPeligrosidad()/2
	}
	method producirCambio(){
		
	}
}

object residuosRadioactivos{
	var property peso = 0
	
	method nivelPeligrosidad(){return 200}
	method cantBulto(){return 1}
	method producirCambio(){
		peso += 15
	}
	
}













