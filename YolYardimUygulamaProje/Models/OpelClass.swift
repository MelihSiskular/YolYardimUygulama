import Foundation
class Opel:Otomobil{
    var opelModel:OpelModel

    init(opelModel:OpelModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.opelModel = opelModel
        
        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum OpelModel{
    case Astra,Astra_S,Corsa,Corsa_S,Insignia,Mariva,Omega,Vectra
}
