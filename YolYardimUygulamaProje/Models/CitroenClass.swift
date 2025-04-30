import Foundation

class Citroen:Otomobil{
    var citroenmodel: CitroenModel

    init(citroenmodel: CitroenModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.citroenmodel = citroenmodel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum CitroenModel{
    case C_Elysée, C3, C4, C5
}