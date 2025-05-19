import Foundation

class Vasita{
    var arac: AracTuru
    var yil: String


    init(arac:AracTuru, yil: String){
        self.arac=arac
        self.yil=yil
    }
}
enum AracTuru: String, CaseIterable, Identifiable,CustomStringConvertible {
    case otomobil
    case motor
    case suv
    
    var id: String { self.rawValue }
    
    var description: String {
        rawValue.capitalized
    }
    var displayName: String {
        switch self {
        case .otomobil: return "Otomobil"
        case .motor: return "Motor"
        case .suv: return "SUV"
        }
    }
}

class Otomobil:Vasita{
    var otomarka:OtomobilMarka
    var otomodel:Any

    init(otomarka:OtomobilMarka,arac: AracTuru, yil:String,otomodel:Any ){
        self.otomarka = otomarka
        self.otomodel = otomodel

        super.init(arac: arac, yil:yil)
    }
}

enum OtomobilMarka:String, CaseIterable, Identifiable, CustomStringConvertible{
    
    case Alfa_Romeo, Audi, BMW, Chevrolet, Citroen, Cupra, Dacia, DS_Automobiles, Fiat, Ford, Honda, Hyundai, Kia, Mazda
    ,Mercedes_Benz, Mini, Mitsubishi, Nissan, Opel, Peugeot, Porsche, Renault, Seat, Skoda, Subaru, Suzuki, Tesla, Tofaş
    , Toyota, Volkswagen, Volvo
    
    var id: String { self.rawValue }
  
    
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
    
}

//enum LastikCap:String, CaseIterable, Identifiable,CustomStringConvertible{
//    case Arora, Bajaj, CFmoto, Hondamoto, Kuba, Mondial, RKS, SYM, TVS, Vespa, Yamaha
//    
//    var id: String { self.rawValue }
//    
//    
//    var description: String {
//        rawValue.replacingOccurrences(of: "_", with: " ")
//    }
//}
//
//enum LastikOran:String, CaseIterable, Identifiable,CustomStringConvertible{
//    case Arora, Bajaj, CFmoto, Hondamoto, Kuba, Mondial, RKS, SYM, TVS, Vespa, Yamaha
//    
//    var id: String { self.rawValue }
//    
//    
//    var description: String {
//        rawValue.replacingOccurrences(of: "_", with: " ")
//    }
//}
//
//enum LastikGenislik:String, CaseIterable, Identifiable,CustomStringConvertible{
//    case 145 ,155 ,165,175,185,195,205,215,225,235,245,255,265,275,285,295,305,315,325,335,345
//    
//    var id: String { self.rawValue }
//    
//    
//    var description: String {
//        rawValue.replacingOccurrences(of: "_", with: " ")
//    }
//}
//
//enum LastikMevsim:String, CaseIterable, Identifiable,CustomStringConvertible{
//    case Yaz, Kış, Mevsimlik
//    
//    var id: String { self.rawValue }
//    
//    
//    var description: String {
//        rawValue.replacingOccurrences(of: "_", with: " ")
//    }
//}





