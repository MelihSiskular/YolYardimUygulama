import Foundation

class Chevrolet_suv:SUV{
    var chevroletsuvModel: ChevroletSUVModel

    init(chevroletsuvModel: ChevroletSUVModel, yil:String){
        self.chevroletsuvModel = chevroletsuvModel

        super.init(suvmarka: .Chevrolet_suv, arac: .suv, yil:yil)
    }
}

enum ChevroletSUVModel : String, CaseIterable, Identifiable, CustomStringConvertible{
    case Captiva

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}