import Foundation

class Suzuki_suv:SUV{
    var suzukisuvModel: SuzukiSUVModel

    init(suzukisuvModel: SuzukiSUVModel, yil:String){
        self.suzukisuvModel = suzukisuvModel

        super.init(suvmarka: .Suzuki_suv, arac: .suv, yil: yil)
    }
}

enum SuzukiSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Grand_Vitara,Vitara
    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}