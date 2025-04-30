import Foundation

class Tofaş:Otomobil{
    var tofaşModel : TofaşModel

    init(tofaşModel: TofaşModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.tofaşModel = tofaşModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum TofaşModel{
    case Doğan, Kartal, Murat, Şahin, Şerçe
}