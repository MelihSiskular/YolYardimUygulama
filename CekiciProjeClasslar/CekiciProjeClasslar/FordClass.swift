import Foundation
class Ford:Otomobil{
    var fordModel:FordModel

    init(fordModel:FordModel,yil:Int){
        self.fordModel = fordModel

        super.init(otomarka:.Ford,arac:.otomobil, yil:yil)
    }
}
enum FordModel:String, CaseIterable, Identifiable{
    case b_max,c_max,Escort,Fiasta,Focus,Fusion,Mondeo,Mustang,Tamus
     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}