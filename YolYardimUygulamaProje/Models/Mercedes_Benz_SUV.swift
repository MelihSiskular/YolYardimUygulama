import Foundation
class Mercedes_Benz_suv:SUV{
    var mercedes_benzsuvModel: Mercedes_benzSUVModel

    init(mercedes_benzsuvModel:Mercedes_benzSUVModel,yil:String){
        self.mercedes_benzsuvModel = mercedes_benzsuvModel

        super.init(suvmarka:.Mercedes_Benz_suv,arac:.suv,yil:yil)
    }
}
enum Mercedes_benzSUVModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case G,GLA,GLB,GLC,GLE
     var id:String{self.rawValue}

 var description: String{
    rawValue.replacingOccurrences(of:"_",with:" ")
}
}
