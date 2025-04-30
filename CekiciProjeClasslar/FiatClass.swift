import Foundation
class Fiat:Otomobil{
    var fiatModel : fiatModel
    init (fiatModel:fiatModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.fiatModel = fiatModel
        super.init(otomobil:otomarka,arac:arac,yil:yil)

    }

}
enum FiatModel{
    case Albea,Bravo,_500,Egea,Linea,Marea,Palio,Panda,Punto,Tempra,Tipo,Uno
}
