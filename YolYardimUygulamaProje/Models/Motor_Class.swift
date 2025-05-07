import Foundation

class Motor:Vasita{
    var motormarka: MotorMarka

    init(motormarka: MotorMarka,arac: AracTuru, yil:String){
        self.motormarka = motormarka

        super.init(arac: arac, yil:yil)
    }
}

enum MotorMarka{
    case Arora, Bajaj, CFmoto, Hondamoto, Kuba, Mondial, RKS, SYM, TVS, Vespa, Yamaha
}
