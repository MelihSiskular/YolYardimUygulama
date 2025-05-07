import Foundation

class Mondial:Motor{
    var mondialmodel:MondialModel

    init(mondialmodel: MondialModel, yil:String){
        self.mondialmodel = mondialmodel

        super.init(motormarka: .Mondial, arac: .motor, yil:yil)
    }
}

enum MondialModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Fury_110i, Virago_50, _50_Revival, _50_SFC, _50_Turismo, _50_UAG, _50_Wing, _125_Drift_L_CBS, _125_Strada

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}