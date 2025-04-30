import Foundation
class Honda:Otomobil{
    var hondaModel:hondaModel

    init(hondaModel:hondaModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.hondaModel = hondaModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)

    }
}
enum HondaModel{
    case Accord,City,Civic
}