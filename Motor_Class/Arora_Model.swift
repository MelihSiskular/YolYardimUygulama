import Foundation

class Arora:Motor{
    var aroramodel: AroraModel

    init(aroramodel: AroraModel, yil:String){
        self.aroramodel = aroramodel
        
        super.init(motormarka: .Arora, arac: .motor, yil:yil)
    }
}

enum AroraModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case AR06, AR_50_Cappuccino, Cappucino_125, Chinf_318, Freedom_50, Mojito_50

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}