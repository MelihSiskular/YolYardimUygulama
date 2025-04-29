import Foundation

class Tesla:Otomobil{
    var teslaModel: TeslaModel

    init(teslaModel: TeslaModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.teslaModel = teslaModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum TeslaModel{
    case Model_3, Model_S, Model_X, Model_Y
}