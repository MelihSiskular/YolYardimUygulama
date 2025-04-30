import Foundation

class BMW:Otomobil{
    var bmwModel: BMWModel

    init(bmwModel: BMWModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int  ){
        self.bmwModel = bmwModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum BMWModel:String, CaseIterable, Identifiable{
    case _1_Serisi, _3_Serisi, _4_Serisi, _5_Serisi, _6_Serisi, _7_Serisi, _8_Serisi, i8, Z4
    
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
