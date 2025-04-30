import Foundation
class Nissan:Otomobil{
    var nissanModel:nissanModel

    init(nissanModel:nissanModel,otomarka:OtomobilMarka,arac:aracTuru,yil:Int){
        self.nisssanModel = nissanModel

        super.init(otomarka:otomarka,arac:arac,yil;yil)
    }
}
enum NissanModel{
    case Almera,CT_R,Micra,Note,Primera
}