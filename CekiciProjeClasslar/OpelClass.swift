import Foundation
class Opel:Otomobil{
    var opelModel:opelModel

    init(opelModel:opelModel,otomarka:OtomobilMarka,arac:aracTuru,yil:Int){
        self.opelModel = opelModel
        
        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum OpelModel{
    case Astra,Astra_S,Corsa,Corsa_S,Insignia,Mariva,Omega,Vectra
}