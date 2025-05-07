import Foundation

class Honda_suv:SUV{
    var hondasuvModel: HondaSUVModel

    init(hondasuvModel: HondaSUVModel, yil:String){
        self.hondasuvModel = hondasuvModel

        super.init(suvmarka: .Honda_suv, arac: .suv, yil:yil)
    }
}

enum HondaSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case CR_V, HR_V

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}