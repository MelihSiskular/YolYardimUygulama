import Foundation
class Nissan:Otomobil{
    var nissanModel:NissanModel

    init(nissanModel:NissanModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.nissanModel = nissanModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum NissanModel{
    case Almera,CT_R,Micra,Note,Primera
}
