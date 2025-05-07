import Foundation

class Peugeot_suv:SUV{
    var peugeotsuvmodel: PeugeotSUVModel

    init(peugeotsuvmodel: PeugeotSUVModel, yil:String){
        self.peugeotsuvmodel = peugeotsuvmodel

        super.init(suvmarka: .Peugeot_suv, arac: .suv, yil: yil)
    }
}

enum PeugeotSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case _408,_2008,_3008,_5008

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}

