import Foundation

class Mazda:Otomobil{
    var mazdaModel:MazdaModel

    init(mazdaModel:MazdaModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.mazdaModel = mazdaModel

        super.init(otomarka: otomarka, arac: arac,yil:yil)
    }
}
enum MazdaModel{
    case _3,_325,_626
}
