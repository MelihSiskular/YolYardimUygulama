import Foundation
class Opel:Otomobil{
    var opelModel:OpelModel

    init(opelModel:OpelModel,yil:Int){
        self.opelModel = opelModel
        
        super.init(otomarka:.Opel,arac:.otomobil,yil:yil)
    }
}
enum OpelModel:String , CaseIterable, Identifiable{
    case Astra,Astra_S,Corsa,Corsa_S,Insignia,Mariva,Omega,Vectra

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}