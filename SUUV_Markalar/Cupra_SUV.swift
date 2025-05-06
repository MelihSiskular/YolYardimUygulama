import Foundation

class Cupra_suv:SUV{
    var cuprasuvModel: CupraSUVModel

    init(cuprasuvModel: CupraSUVModel, yil:Int){
        self.cuprasuvModel = cuprasuvModel

        super.init(suvmarka: .Cupra_suv, arac: .suv, yil:yil)
    }
}

enum CupraSUVModel : String, CaseIterable, Identifiable, CustomStringConvertible{
    case Formentor

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
