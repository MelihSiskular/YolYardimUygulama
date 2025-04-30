import Foundation

class Volvo:Otomobil{
    var volvoModel: VolvoModel

    init(volvoModel: VolvoModel, yil:Int){
        self.volvoModel = volvoModel

        super.init(otomarka: .Volvo, arac: .otomobil, yil: yil)
    }
}

enum VolvoModel: String, CaseIterable, Identifiable{
    case S40, S60, S80, S90, V40, V40_Cross_Country, V90_Cross_Country

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}