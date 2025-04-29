import Foundation

class Toyota:Otomobil{
    var toyotaModel : ToyotaModel

    init(toyotaModel: ToyotaModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.toyotaModel = toyotaModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum ToyotaModel{
    case Auris, Avensis, Carina, Corolla, Corona, Verso, Yaris
}