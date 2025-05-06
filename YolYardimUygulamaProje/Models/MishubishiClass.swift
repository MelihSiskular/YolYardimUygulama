import Foundation

class Mitshubishi:Otomobil{
    var mitshubishiModel: MitshubishiModel

    init(mitshubishiModel:MitshubishiModel,yil:String,otomodel: Any){
        self.mitshubishiModel = mitshubishiModel

        super.init(otomarka: .Mitsubishi,arac:.otomobil,yil:yil,otomodel: otomodel)

    }
}
enum MitshubishiModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case Colt, Lancer, Lancer_Evolation,Carisma

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
