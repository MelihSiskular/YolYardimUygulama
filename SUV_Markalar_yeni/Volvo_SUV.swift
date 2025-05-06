import Foundation

class Volvo_suv:SUV{
    var volvosuvModel: VolvoSUVModel

    init(volvosuvModel: VolvoSUVModel, yil:String){
        self.volvoModel = volvosuvModel

        super.init(suvmarka: .Volvo_suv, arac: .suv, yil: yil)
    }
}

enum VolvoSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case XC_40,XC_60,XC_90

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}