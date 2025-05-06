import Foundation

class Volvo:Otomobil{
    var volvoModel: VolvoModel

    init(volvoModel: VolvoModel, yil:String,otomodel: Any){
        self.volvoModel = volvoModel

        super.init(otomarka: .Volvo, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum VolvoModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case S40, S60, S80, S90, V40, V40_Cross_Country, V90_Cross_Country

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
