import Foundation

class Ford_suv:SUV{
    var fordsuvModel: FordSUVModel

    init(fordsuvModel: FordSUVModel, yil:Int){
        self.fordsuvModel = fordsuvModel

        super.init(suvmarka: .Ford_suv, arac: .suv, yil:yil)
    }
}

enum FordSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case EcoSport, Kuga, Puma, Ranger

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}