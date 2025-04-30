import Foundation
class Mitshubishi:Otomobil{
    var mitshubishiModel: MitshubishiModel

    init(mitshubishiModel:MitshubishiModel,yil:Int){
        self.mitshubishiModel = mitshubishiModel

        super.init(otomarka:.Mitshubishi,arac:.otomobil,yil:yil)

    }
}
enum MitshubishiModel:String,CaseIterable,Identifiable{
    case Colt, Lancer, Lancer_Evolation,Carisma

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}