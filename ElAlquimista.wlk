object alquimista {
	var itemsDeCombate = []
	var itemsDeRecoleccion = []
	method tieneCriterio() {
		return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate() / 2
	}
//-------------------PUNTO 1	
	method cantidadDeItemsDeCombate(){
		return itemsDeCombate.size()
	}
	
	method cantidadDeItemsDeCombateEfectivos(){
		return itemsDeCombate.count({itemDeCombate => itemDeCombate.esEfectivo()}) //CUENTA LOS QUE CUMPLEN ESE CRITERIO Y TE DICE LA CANTIDAD
	}
	
	
	method agregarItem(unItem) {
		itemsDeCombate.add(unItem)
	}
	//---------------PUNTO 2
	method esBuenExplorador() {
		return self.cantidadDeItemsDeRecoleccion() >= 3
	}
	method agregarItemDeRecoleccion(unItemDeRecoleccion) {
		itemsDeRecoleccion.add(unItemDeRecoleccion)
	}
	
	method cantidadDeItemsDeRecoleccion() {
		return itemsDeRecoleccion.size()
	}
	
	method capacidadOfensiva(){
		return itemsDeCombate. sum {item => item.capacidadOfensiva()}
	}
	
}

object bomba {
	var danio = 150
	method esEfectivo() {
		return danio > 100
	}
	method capacidadOfensiva(){
		return danio / 2
	}
}

object pocion {
	var materiales = []
	var poderCurativo = 25
	
	method esEfectivo(){
		return poderCurativo > 50 and self.fueCreadoPorAlgunMaterialMistico()
	}
	
	method fueCreadoPorAlgunMaterialMistico(){
		return materiales.any ({material => material.esMistico()})
	}
	
		method capacidadOfensiva(){
		return poderCurativo + 10 * self.cantidadMaterialesMisticos()
	}
	
	method cantidadMaterialesMisticos(){
		return materiales.count{material =>material.esMistico()}
	}
}

object debilitador {
	
		var materiales = []
		var potencia = 0
		
		method esEfectivo(){
			return (potencia > 0) and self.fueCreadoPorAlgunMaterialMistico() . negate()	
		}
		method fueCreadoPorAlgunMaterialMistico(){
			return materiales.any ({material => material.esMistico()})
		}
		method materialesMisticos(){
			return materiales.filter{material => material.esMistico()}
		}
		method cantMaterialesMisticos(){
			return self.materialesMisticos().size()
		}
		method cantMateriales(){
			return materiales.size()
		}
		
		method noTieneMaterialMistico(){
			return self.cantMaterialesMisticos() == 0
		}
	
		method esMistico(){
			return true
		}
	
		method capacidadOfensiva(){
			if(self.noTieneMaterialMistico()) return 5
			else return 12 * self.cantMateriales()
		}
	
}