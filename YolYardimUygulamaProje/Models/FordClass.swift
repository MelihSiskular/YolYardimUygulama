import Foundation
class Ford:Otomobil{
    var fordModel:FordModel

    init(fordModel:FordModel,yil:String,otomodel: Any){
        self.fordModel = fordModel

        super.init(otomarka:.Ford,arac:.otomobil, yil:yil,otomodel: otomodel)
    }
}
enum FordModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case b_max,c_max,Escort,Fiasta,Focus,Fusion,Mondeo,Mustang,Tamus
     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
