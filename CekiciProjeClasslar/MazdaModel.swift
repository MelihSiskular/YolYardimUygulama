import Foundation

class Mazda:Otomobil{
    var mazdaModel:mazdaModel

    init(mazdaModel:mazdaModel,otomarka:OtomobilMarka,arac:AraCTuru,yil:Int){
        self.mazdaModel = mazdaModel

        super.init(otomarka: otomarka, arac: arac,yil:yil)
    }
}
enum mazdaModel{
    case _3,_325,_626
}