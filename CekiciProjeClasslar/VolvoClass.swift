import Foundation

class Volvo:Otomobil{
    var volvoModel: VolvoModel

    init(volvoModel: VolvoModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.volvoModel = volvoModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum VolvoModel{
    case S40, S60, S80, S90, V40, V40_Cross_Country, V90_Cross_Country
}