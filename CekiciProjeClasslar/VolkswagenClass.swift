import Foundation

class Volkswagen:Otomobil{
    var volkswagenModel: VolkswagenModel

    init(volkswagenModel: VolkswagenModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.volkswagenModel = volkswagenModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum VolkswagenModel{
    case Arteon, Beetle, Bora, Golf, Jetta, Passat, Passat_Variant, Polo, Scirocco, Touran, CC
}