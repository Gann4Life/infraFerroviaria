class VagonDePasajeros {
	var property ancho
	var property largo
	var property tieneBanio = false
	var property estaOrdenado = true
	
	method pasajeros() = largo * if (ancho <= 3) 8 else 10
	method capacidadPasajeros() = self.pasajeros() - if (estaOrdenado) 0 else 15
	
	method maximaCarga() = if(tieneBanio) 300 else 800
	method pesoMaximo() = 2000 + self.capacidadPasajeros()*80 + self.maximaCarga()
}

class VagonDeCarga {
	var property cargaMaximaIdeal = 8000
	var property maderasSueltas = 0
	
	method tieneBanio() = false
	method capacidadPasajeros() = cargaMaximaIdeal - maderasSueltas*400
	method pesoMaximo() = 1500 + self.capacidadPasajeros()
}

class VagonDormitorio {
	var property compartimientos = 12
	var property camasPorCompartimiento = 4
	const maximaCarga = 1200
	
	method tieneBanio() = true
	method capacidadPasajeros() = compartimientos * camasPorCompartimiento
	method pesoMaximo() = 4000 + 80*self.capacidadPasajeros() + maximaCarga
}

class Formacion {
	var vagones = []
	method addVagon(vagon) { vagones.add(vagon) }
	
	method esPopular(vagon) = vagon.capacidadPasajeros() > 50
	method esCarguero(vagon) = vagon.pesoMaximo() > 1000
	method vagonMasPesado() = vagones.max{e => e.pesoMaximo()}
	method vagonMasLiviano() = vagones.min{e => e.pesoMaximo()}
	method dispersionDePesos() = self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo() 
	method totalBanios() = 0
	method realizarMantenimiento(vagon) { if(!vagon.ordenado()) vagon.ordenado(true) }
}