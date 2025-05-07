import Foundation

class BMW_suv:SUV{
    var bmwsuvModel: BMWSUVModel

    init(bmwsuvModel: BMWSUVModel, yil:String){
        self.bmwsuvModel = bmwsuvModel

        super.init(suvmarka: .BMW_suv, arac: .suv, yil:yil)
    }
}

enum BMWSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case X1, X3, X5, X6

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}