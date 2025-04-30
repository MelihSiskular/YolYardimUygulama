import Foundation
class Mitshubishi:Otomobil{
    var mitshubishiModel: MitshubishiModel

    init(mitshubishiModel:MitshubishiModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.mitshubishiModel = mitshubishiModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)

    }
}
enum MitshubishiModel{
    case Colt, Lancer, Lancer_Evolation,Carisma
}
