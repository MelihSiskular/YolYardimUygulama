import Foundation
class Mitshubishi:Otomobil{
    var mitshubishiModel: mitshubishiModel

    init(mitshubishiModel:mitshubishiModel,otomarka;OtomobilMarka,arac:AracTuru,yil:yil){
        self.mitshubishiModel = mitshubishiModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)

    }
}
enum MitshubishiModel{
    case Colt, Lancer, Lancer_Evolation,Carisma
}