import Foundation

class HondaMoto: Motor{
    var hondamotomodel: HondaMotoModel

    init(hondamotomodel: HondaMotoModel, yil:String){
        self.hondamotomodel = hondamotomodel

        super.init(motormarka: .Hondamoto, arac: .motor, yil:yil)
    }
}

enum HondaMotoModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Activa_100, Activa_125, Activa_S, ADV_350, CB_125E, CB_125_F, CB_250_R, CB_750_Hornet, CBF_150, CBR_125_R, CBR_250_R , CBR_500R, CBR_600_RR, CBR_650_R, CBR_1000_RR

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
