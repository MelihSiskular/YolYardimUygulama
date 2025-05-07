import Foundation

class Toyota_suv:SUV{
    var toyotasuvModel : ToyotaSUVModel

    init(toyotasuvModel: ToyotaSUVModel, yil:String){
        self.toyotasuvModel = toyotasuvModel

        super.init(suvmarka: .Toyota_suv, arac: .suv, yil: yil)
    }
}

enum ToyotaSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case C_HR,Corolla_Cross,Hilux,Land_Cruiser,RAW_4

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}