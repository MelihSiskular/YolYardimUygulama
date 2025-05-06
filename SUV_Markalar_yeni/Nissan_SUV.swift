import Foundation
class Nissan_suv:SUV{
    var nissansuvModel:NissanSUVModel

    init(nissansuvModel:NissanSUVModel,yil:Int){
        self.nissansuvModel = nissansuvModel

        super.init(suvmarka:.Nissan_suv,arac:.suv,yil:yil)
    }
}
enum NissanSUVModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case Juke,Navara,Qashqai

     var id:String{self.rawValue}

 var description: String{
    rawValue.replacingOccurrences(of:"_",with:" ")
}
}