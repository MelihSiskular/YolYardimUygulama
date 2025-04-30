import Foundation
class Fiat:Otomobil{
    var fiatModel :FiatModel
    init (fiatModel:FiatModel,yil:Int){
        self.fiatModel = fiatModel
        super.init(otomobil:.Fiat,arac:.otomobil,yil:yil)

    }

}
enum FiatModel:String, CaseIterable, Identifiable{
    case Albea,Bravo,_500,Egea,Linea,Marea,Palio,Panda,Punto,Tempra,Tipo,Uno

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}