import Foundation

class Vasita{
    var arac: AracTuru
    var yil: Int


    init(arac:AracTuru, yil: Int){
        self.arac=arac
        self.yil=yil
    }
}
enum AracTuru :String, CaseIterable, Identifiable{


    case otomobil, motor, suv
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}

class Otomobil:Vasita{
    var otomarka:OtomobilMarka
    //var otomodel:OtomobilModel

    init(otomarka:OtomobilMarka,arac: AracTuru, yil:Int ){
        self.otomarka = otomarka
        //self.otomodel = otomodel

        super.init(arac: arac, yil:yil)
    }
}

enum OtomobilMarka:String, CaseIterable, Identifiable{
    
    case Alfa_Romeo, Audi, BMW, Chevrolet, Citroen, Cupra, Dacia, DS_Automobiles, Fiat, Ford, Honda, Hyundai, Kia, Mazda
    ,Mercedes_Benz, Mini, Mitsubishi, Nissan, Opel, Peugeot, Porsche, Renault, Seat, Skoda, Subaru, Suzuki, Tesla, Tofaş
    , Toyota, Volkswagen, Volvo
    
    var id: String { self.rawValue }
    
    var displayName: String {
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
    
}





