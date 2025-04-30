import Foundation

class Seat:Otomobil{
    var seatModel: SeatModel
    
    init(seatModel: SeatModel, yil:Int){
        self.seatModel = seatModel

        super.init(otomarka: .Seat, arac: .otomobil, yil: yil)
    }
}

enum SeatModel: String, CaseIterable, Identifiable{
    case Cordoba, Ibiza, _Leon, Toledo

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}