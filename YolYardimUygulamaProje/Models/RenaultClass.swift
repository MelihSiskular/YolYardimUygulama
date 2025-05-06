import Foundation

class Renault:Otomobil{
    var renaultModel: RenaultModel

    init(renaultModel: RenaultModel, yil:String,otomodel: Any){
        self.renaultModel = renaultModel

        super.init(otomarka: .Renault, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum RenaultModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Clio, Fluence, Grand_Scenic, Laguna, Latitude, Megan, Megane_E_Tech, Modus, Scenic, Symbol, Taliant, Talisman, Twingo, R_9, R_11, R_12, R_19, R_21

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
