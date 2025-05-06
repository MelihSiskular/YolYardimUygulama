import Foundation

class Audi_suv:SUV{
    var audisuvModel: AudiSUVModel

    init(audisuvModel: AudiSUVModel, yil:String){
        self.audisuvModel = audisuvModel

        super.init(suvmarka: .Audi_suv, arac: .suv, yil:yil)
    }
}

enum AudiSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Q2, Q3, Q4, Q5, Q7, Q8

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}