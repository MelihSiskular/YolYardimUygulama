import Foundation

class Subaru:Otomobil{
    var subaruModel: SubaruModel

    init(subaruModel: SubaruModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.subaruModel = subaruModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum SubaruModel{
    case BRZ, Impreza, Legacy
}