import Foundation

class Dacia:Otomobil{
    var daciaModel: DaciaModel

    init(daciaModel:DaciaModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.daciaModel = daciaModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum DaciaModel{
    case Lodgy, Logan, Sandero, Solenza
}