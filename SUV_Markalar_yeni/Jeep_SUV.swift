import Foundation

class Jeep_suv:SUV{
    var jeepsuvModel: JeepSUVModel

    init(jeepsuvModel: JeepSUVModel, yil:String){
        self.jeepsuvModel = jeepsuvModel

        super.init(suvmarka: .Jeep_suv, arac: .suv, yil:yil)
    }
}

enum JeepSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Cherokee, Compass, Grand_Cherokee, Renegade

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}