import Foundation

class Motor:Vasita{
    var motormarka: MotorMarka

    init(motormarka: MotorMarka,arac: AracTuru, yil:Int){
        self.motormarka

        super.init(arac: arac, yil:yil)
    }
}

enum MotorMarka: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Arora, Bajaj, CFmoto, Hondamoto, Kuba, Mondial, RKS, SYM, TVS, Vespa, Yamaha

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}