import Foundation

class Seat_suv:SUV{
    var seatsuvModel: SeatSUVModel
    
    init(seatsuvModel: SeatSUVModel, yil:String){
        self.seatsuvModel = seatsuvModel

        super.init(suvmarka: .Seat_suv, arac: .suv, yil: yil)
    }
}

enum SeatSUVModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Arona,Ateca

    var id: String {self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}