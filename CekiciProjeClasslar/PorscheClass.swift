import Foundation

class Porsche:Otomobil{
    var porscheModel: PorscheModel

    init(porscheModel: PorscheModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.porscheModel = porscheModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum PorscheModel{
    case _718, _911, Boxtrer, Cayman, Panamera, Taycan
}
