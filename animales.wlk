class Animal {
  method amenaza()
  method nivelEnergia()
  method recuperarse(unArea)
  method estaSatisfecho(unArea){
    return unArea.agua() > 3 * self.nivelEnergia()  or self.condicionAdicion(unArea)
  }
  method condicionAdicion(unArea)

}

class Ciervo inherits Animal {
  var nivelAlterta = 20
  method nivelAlerta() = nivelAlterta
  override method nivelEnergia() = if(nivelAlterta <= 30){300}else{ self.nivelAlerta() * 2}
  override method amenaza() {
    nivelAlterta *= 2
  }
  override method  recuperarse(unArea) {
    unArea.consumirAgua(4)
    nivelAlterta += 20
  }
  override method condicionAdicion(unArea)= unArea.agua() >= 10
}

class Felino inherits Animal {
  var peso 
  var ferocidad 
  method peso() = peso
  override method nivelEnergia() = if (peso < 90) {ferocidad} else {ferocidad * 0.5}
  override method amenaza() {
    peso += 20
  }
  method afilarGarras(){
    peso -= 10
    ferocidad += 10  
  }

  override method  recuperarse(unArea) {
    unArea.consumirRefugio(8)
    peso += 15
    ferocidad += 15
  }
  override method condicionAdicion(unArea){
    return unArea.hayAlgunoMasDebil(self.nivelEnergia())
  }
}

class Ave inherits Animal {
  var altura
  method altura() = altura
  override method nivelEnergia() = altura * 3 
  override method amenaza() {
    altura += 50
  }
  method vuelosReconocimiento() {
    altura = 5
  }
  override method  recuperarse(unArea) {}
  override method condicionAdicion(unArea) = false
}

class CiervoDeMontana inherits Ciervo {
  override method nivelEnergia() = super() + 15
  override method  recuperarse(unArea) {
    super(unArea)
    nivelAlterta +=1
  }

}

class FelinoDeManchas inherits Felino {
    var manchas
    method manchas() = manchas
    override method nivelEnergia() = super() + 2 * manchas
    override method amenaza(){
      super()
      manchas += 1
    }
    override method condicionAdicion(unArea){
      return unArea.refugio() >= manchas
  }
}