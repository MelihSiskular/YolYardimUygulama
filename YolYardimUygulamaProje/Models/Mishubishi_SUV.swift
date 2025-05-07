import Foundation
class Mitsubishi_suv:SUV{
    var mitsubishisuvModel: MitsubishiSUVModel

    init(mitsubishisuvModel:MitsubishiSUVModel,yil:String){
        self.mitsubishisuvModel = mitsubishisuvModel

        super.init(suvmarka:.Mitsubishi_suv,arac:.suv,yil:yil)

    }
}
enum MitsubishiSUVModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case L200

     var id:String{self.rawValue}

 var description: String{
    rawValue.replacingOccurrences(of:"_",with:" ")
}
}
