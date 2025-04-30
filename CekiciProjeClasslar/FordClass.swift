import Foundation
class Ford:Otomobil{
    var fordModel:fordModel

    init(fordModel:fordModel,otomarka:OtomobilMarka,AracTuru:AracTuru,yil:Int){
        self.fordModel = fordModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum FordModel{
    case b_max,c_max,Escort,Fiasta,Focus,Fusion,Mondeo,Mustang,Tamus
}
