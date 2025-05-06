import Foundation

class Skoda_suv:SUV{
    var skodasuvModel : SkodaSUVModel

    init(skodasuvModel: SkodaSUVModel, yil:String){
        self.skodasuvModel = skodasuvModel

        super.init(suvmarka: .Skoda_suv, arac: .suv, yil: yil)
    }
}

enum SkodaSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Kamiq,Karoq,Kodiaq,Yeti

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}