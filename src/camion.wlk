import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	const pesoMaximo = 2500
	
	method pesoCarga(){
		return cosas.sum({cosa => cosa.peso()})
	}
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoTotal(){
		return tara + self.pesoCarga()
	}
	method excedidoDePeso(){
		return self.pesoTotal() > pesoMaximo
	}
	method objetosPeligrosos(nivel){
		return cosas.filter {cosa => cosa.nivelPeligrosidad()>nivel}
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter {cosa2 => cosa2.nivelPeligrosidad()>cosa.nivelPeligrosidad()}
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all {cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad}
	}
}
