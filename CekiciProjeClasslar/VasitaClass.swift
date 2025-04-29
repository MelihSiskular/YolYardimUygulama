import Foundation

class Vasita{
    var arac: AracTuru
    var yil: Int 

    init(arac:AracTuru, yil: Int){
        self.arac=arac
        self.yil=yil
    }
}
enum AracTuru{
    case otomobil, motor, suv
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

enum OtomobilMarka{
    case Alfa_Romeo, Audi, BMW, Chevrolet, Citroen, Cupra, Dacia, DS_Automobiles, Fiat, Ford, Honda, Hyundai, Kia, Mazda
    ,Mercedes_Benz, Mini, Mitsubishi, Nissan, Opel, Peugeot, Porsche, Renault, Seat, Skoda, Subaru, Suzuki, Tesla, Tofaş
    , Toyota, Volkswagen, Volvo
}

class Cupra{
    var cupraModel : String = "Leon"
}



