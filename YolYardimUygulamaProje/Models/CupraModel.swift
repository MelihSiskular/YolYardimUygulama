import Foundation

class Cupra:Otomobil{
    var cupraModel : CupraModel

    init(cupraModel: CupraModel, yil:String,otomodel: Any){
        self.cupraModel = cupraModel

        super.init(otomarka: .Cupra, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum CupraModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Leon

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
