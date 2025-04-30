import Foundation
class Ford:Otomobil{
    var fordModel:FordModel

    init(fordModel:FordModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.fordModel = fordModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum FordModel{
    case b_max,c_max,Escort,Fiasta,Focus,Fusion,Mondeo,Mustang,Tamus
}
