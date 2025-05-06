import Foundation

class Togg_suv:SUV{
    var toggsuvModel:ToggSUVModel

    init(toggsuvModel:ToggSUVModel, yil:String){
        self.toggsuvModel = toggsuvModel

        super.init(suvmarka:.Togg_suv,arac:.suv,yil:yil)
    }
}
enum ToggSUVModel:String, CaseIterable,Identifiable,CustomStringConvertible{
    case T10X
    var id:String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of:"_",with:" ")
    }
}