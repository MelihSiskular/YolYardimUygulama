import Foundation

class Porsche_suv:SUV{
    var porschesuvModel: PorscheSUVModel

    init(porschesuvModel: PorscheSUVModel, yil:String){
        self.porschesuvModel = porschesuvModel

        super.init(suvmarka: .Porsche_suv, arac: .suv, yil: yil)
    }
}

enum PorscheSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Cayenne,Cayenne_Coupe,Macan

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}