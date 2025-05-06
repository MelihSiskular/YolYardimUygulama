import Foundation
class Opel:Otomobil{
    var opelModel:OpelModel

    init(opelModel:OpelModel,yil:String,otomodel: Any){
        self.opelModel = opelModel
        
        super.init(otomarka:.Opel,arac:.otomobil,yil:yil,otomodel: otomodel)
    }
}
enum OpelModel:String , CaseIterable, Identifiable,CustomStringConvertible{
    case Astra,Astra_S,Corsa,Corsa_S,Insignia,Mariva,Omega,Vectra

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
