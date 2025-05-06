import Foundation

class Chery_suv:SUV{
    var cherysuvModel: CherySUVModel

    init(cherysuvModel: CherySUVModel, yil:String){
        self.cherysuvModel = cherysuvModel

        super.init(suvmarka: .Chery_suv, arac: .suv, yil:yil)
    }
}

enum CherySUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Omoda_5, Tiggo_3, Tiggo_7, Tiggo_8

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}