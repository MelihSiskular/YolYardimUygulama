import Foundation
class Fiat:Otomobil{
    var fiatModel :FiatModel
    init (fiatModel:FiatModel,yil:String,otomodel: Any){
        self.fiatModel = fiatModel
        super.init(otomarka:.Fiat,arac:.otomobil,yil:yil,otomodel: otomodel)

    }

}
enum FiatModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case Albea,Bravo,_500,Egea,Linea,Marea,Palio,Panda,Punto,Tempra,Tipo,Uno

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
