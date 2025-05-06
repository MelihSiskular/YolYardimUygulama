import Foundation

class BMW:Otomobil{
    var bmwModel: BMWModel

    init(bmwModel: BMWModel, yil:String,otomodel: Any ){
        self.bmwModel = bmwModel

        super.init(otomarka: .BMW, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum BMWModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case _1_Serisi, _3_Serisi, _4_Serisi, _5_Serisi, _6_Serisi, _7_Serisi, _8_Serisi, i8, Z4

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
