import Foundation
class Opel_suv:SUV{
    var opelsuvModel:OpelSUVModel

    init(opelsuvModel:OpelSUVModel,yil:Int){
        self.opelsuvModel = opelsuvModel
        
        super.init(suvmarka:.Opel_suv,arac:.suv,yil:yil)
    }
}
enum OpelSUVModel:String , CaseIterable, Identifiable,CustomStringConvertible{
    case Crossland,Crossland_X,Grandland,Grandland_X,Mokka

     var id:String{self.rawValue}

 var description: String{
    rawValue.replacingOccurrences(of:"_",with:" ")
}
}