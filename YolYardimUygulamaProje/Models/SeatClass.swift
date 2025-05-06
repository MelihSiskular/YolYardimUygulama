import Foundation

class Seat:Otomobil{
    var seatModel: SeatModel
    
    init(seatModel: SeatModel, yil:String,otomodel: Any){
        self.seatModel = seatModel

        super.init(otomarka: .Seat, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum SeatModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Cordoba, Ibiza, _Leon, Toledo

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
