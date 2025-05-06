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





