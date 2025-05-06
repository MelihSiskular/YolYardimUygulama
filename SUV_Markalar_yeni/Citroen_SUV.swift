import Foundation

class Citroen_suv:SUV{
    var citroensuvModel: CitroenSUVModel

    init(citroensuvModel: CitroenSUVModel, yil:String){
        self.citroensuvModel = citroensuvModel

        super.init(suvmarka: .Citroen_suv, arac: .suv, yil:yil)
    }
}

enum CitroenSUVModel : String, CaseIterable, Identifiable, CustomStringConvertible{
    case C3, C4, C5

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}