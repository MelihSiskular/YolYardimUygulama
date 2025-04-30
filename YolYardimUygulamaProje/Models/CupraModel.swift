import Foundation

class Cupra:Otomobil{
    var cupraModel : CupraModel

    init(cupraModel: CupraModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.cupraModel = cupraModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum CupraModel{
    case Leon
}