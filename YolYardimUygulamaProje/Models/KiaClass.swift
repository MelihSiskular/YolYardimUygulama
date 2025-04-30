import Foundation

class Kia:Otomobil{
    var kiaModel:KiaModel

    init(kiaModel:KiaModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.kiaModel = kiaModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum KiaModel{
    case Ceed,Cerato,Picanto,Rio
}
