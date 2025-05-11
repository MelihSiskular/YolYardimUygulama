import Foundation

class Bajaj:Motor{
    var bajajmodel: BajajModel

    init(bajajmodel: BajajModel, yil:String){
        self.bajajmodel = bajajmodel

        super.init(motormarka: .Bajaj, arac: .motor, yil:yil)
    }
}

enum BajajModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Dominar_250_D, Dominar_400_UG, Dominar_D_400, Pulsar_N_250, Pulsar_NS_200, Pulsar_RS_200

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}