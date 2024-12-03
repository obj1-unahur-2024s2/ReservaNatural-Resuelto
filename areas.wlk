
class Area {
    const animales =  []
    var agua 
    var refugio

    method agua() = agua
    method refugio() = refugio
    method agregarAnimales(unaLista) {
        animales.addAll(unaLista)
    }

    method consumirAgua(unaCantidad) {
        agua = 0.max(agua - unaCantidad)
    }

    method consumirRefugio(unaCantidad) {
        refugio = 0.max(refugio - unaCantidad)
    }

    method debiles() = animales.filter { a => a.nivelEnergia() < reserva.debilidadComun() }
    method esHabitable() = agua >= 700 and refugio.between(200, 300) 
    method modoRecuperacion() { animales.forEach({ a => a.recuperarse(self)}) }
    method vigoroso() = animales.max { a => a.nivelEnergia()}
    method incendio() {
        animales.forEach{ a=> a.amenaza()}
        agua *= 0.9
    }

    method valorEnergeticoDebil() = self.debiles().sum { a=> a.nivelEnergia()}
    method hayAlgunoMasDebil(unValor){
        return animales.any { a=> a.nivelAlerta() < unValor}
    }
    method enEquilibrio() {
        return self.esHabitable() and self.todosSatisfechos()
    }
    method todosSatisfechos() =  animales.all( { a=> a.estaSatisfecho(self)})

    method quitarMasVigoroso() {
        animales.remove( self.vigoroso() )
    }
}

object reserva {
    const property areas = []
    var property debilidadComun = 50
    method expandirse() {
        const animalesVigorosos = areas.map({ a => a.vigoroso()})
        self.quitarAnimales()
        areas.add( new Area(agua=1000, refugio=800, animales=animalesVigorosos ) ) 
    }
    method quitarAnimales(){
        areas.forEach { a=> a.quitarMasVigoroso()}
    }
}