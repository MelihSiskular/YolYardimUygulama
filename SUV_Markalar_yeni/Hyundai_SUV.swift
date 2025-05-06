import Foundation

class Hyundai_suv:SUV{
    var hyundaisuvModel: HyundaiSUVModel

    init(hyundaisuvModel: HyundaiSUVModel, yil:String){
        self.hyundaisuvModel = hyundaisuvModel

        super.init(suvmarka: .Hyundai_suv, arac: .suv, yil:yil)
    }
}

enum HyundaiSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Bayon, ix35, Kona, Santa_Fe, Tucson

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}