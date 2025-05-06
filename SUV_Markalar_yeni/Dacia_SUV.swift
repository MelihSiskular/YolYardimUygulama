import Foundation

class Dacia_suv:SUV{
    var daciasuvModel: DaciaSUVModel

    init(daciasuvModel: DaciaSUVModel, yil:String){
        self.daciasuvModel = daciasuvModel

        super.init(suvmarka: .Dacia_suv, arac: .suv, yil:yil)
    }
}

enum DaciaSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Duster, Sandero

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}