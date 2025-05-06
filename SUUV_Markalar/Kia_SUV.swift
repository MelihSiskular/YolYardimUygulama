import Foundation

class Kia_suv:SUV{
    var kiasuvModel: KiaSUVModel

    init(kiasuvModel: KiaSUVModel, yil:Int){
        self.kiasuvModel = kiasuvModel

        super.init(suvmarka: .Kia_suv, arac: .suv, yil:yil)
    }
}

enum KiaSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Sorento, Sportage, Stonic, XCeed

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}