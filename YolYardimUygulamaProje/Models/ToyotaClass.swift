import Foundation

class Toyota:Otomobil{
    var toyotaModel : ToyotaModel

    init(toyotaModel: ToyotaModel, yil:String,otomodel: Any){
        self.toyotaModel = toyotaModel

        super.init(otomarka: .Toyota, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum ToyotaModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Auris, Avensis, Carina, Corolla, Corona, Verso, Yaris

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
