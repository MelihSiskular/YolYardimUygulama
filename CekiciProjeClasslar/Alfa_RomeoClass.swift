import Foundation

class Alfa_Romeo:Otomobil{
    var alfaModel: AlfaModel

    init(alfaModel: AlfaModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int ){
        self.alfaModel = alfaModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}
enum AlfaModel{
    case Giulietta, _156, _159
}