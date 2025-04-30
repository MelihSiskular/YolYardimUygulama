import Foundation

class Cupra:Otomobil{
    var cupraModel : CupraModel

    init(cupraModel: CupraModel, yil:Int){
        self.cupraModel = cupraModel

        super.init(otomarka: .Cupra, arac: .otomobil, yil: yil)
    }
}

enum CupraModel: String, CaseIterable, Identifiable{
    case Leon

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}