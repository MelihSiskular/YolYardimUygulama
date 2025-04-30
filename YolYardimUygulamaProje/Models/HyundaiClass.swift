import Foundation
class Hyundai:Otomobil{
    var hyundaiModel:HyundaiModel

    init(hyundaiModel:HyundaiModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.hyundaiModel = hyundaiModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum HyundaiModel{
    case Accent,Accent_Blue,Accent_Era,Elantra,Getz,i10,I20,I30,Sonata
}
