import Foundation

class Suzuki:Otomobil{
    var suzukiModel: SuzukiModel

    init(suzukiModel: SuzukiModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.suzukiModel = suzukiModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum SuzukiModel{
    case Alto, Swift, SX4, Maruti
}