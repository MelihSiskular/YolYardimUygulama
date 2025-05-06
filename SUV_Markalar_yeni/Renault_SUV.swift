import Foundation

class Renault_suv:SUV{
    var renaultsuvModel: RenaultSUVModel

    init(renaultsuvModel: RenaultSUVModel, yil:String){
        self.renaultsuvModel = renaultsuvModel

        super.init(suvmarka: .Renault_suv, arac: .suv, yil: yil)
    }
}

enum RenaultSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Austral,Captur,Kadjar,Koleos

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}