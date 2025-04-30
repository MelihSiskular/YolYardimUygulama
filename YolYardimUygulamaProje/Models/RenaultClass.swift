import Foundation

class Renault:Otomobil{
    var renaultModel: RenaultModel

    init(renaultModel: RenaultModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.renaultModel = renaultModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum RenaultModel{
    case Clio, Fluence, Grand_Scenic, Laguna, Latitude, Megan, Megane_E_Tech, Modus, Scenic, Symbol, Taliant, Talisman, Twingo, R_9, R_11, R_12, R_19, R_21
}