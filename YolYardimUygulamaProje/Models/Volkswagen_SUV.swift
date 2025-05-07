import Foundation

class Volkswagen_suv:SUV{
    var volkswagensuvModel: VolkswagenSUVModel

    init(volkswagensuvModel: VolkswagenSUVModel, yil:String){
        self.volkswagensuvModel = volkswagensuvModel

        super.init(suvmarka: .Volkswagen_suv, arac: .suv, yil: yil)
    }
}

enum VolkswagenSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Amarok,T_Cross,T_Roc,Taigo,Tiguan,Touareg

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}