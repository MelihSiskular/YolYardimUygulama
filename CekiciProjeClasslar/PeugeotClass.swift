import Foundation

class Peugeot:Otomobil{
    var peugeotmodel: PeugeotModel

    init(peugeotmodel: PeugeotModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.peugeotmodel = peugeotmodel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum PeugeotModel{
    case _106, _107,_206, _206plus, _207, e_208, _301, _306, _307, _308, e3_08, _406, _407, _508, RCZ
}