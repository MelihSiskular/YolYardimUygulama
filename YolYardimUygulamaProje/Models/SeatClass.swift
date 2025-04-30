import Foundation

class Seat:Otomobil{
    var seatModel: SeatModel
    
    init(seatModel: SeatModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.seatModel = seatModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum SeatModel{
    case Cordoba, Ibiza, _Leon, Toledo
}