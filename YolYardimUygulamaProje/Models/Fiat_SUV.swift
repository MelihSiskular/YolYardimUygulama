import Foundation

class Fiat_suv:SUV{
    var fiatsuvModel: FiatSUVModel

    init(fiatsuvModel: FiatSUVModel, yil:String){
        self.fiatsuvModel = fiatsuvModel

        super.init(suvmarka: .Fiat_suv, arac: .suv, yil:yil)
    }
}

enum FiatSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Egea_Cross, _500x

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}