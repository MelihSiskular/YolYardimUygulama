import Foundation

class Toyota:Otomobil{
    var toyotaModel : ToyotaModel

    init(toyotaModel: ToyotaModel, yil:Int){
        self.toyotaModel = toyotaModel

        super.init(otomarka: .Toyota, arac: .otomobil, yil: yil)
    }
}

enum ToyotaModel: String, CaseIterable, Identifiable{
    case Auris, Avensis, Carina, Corolla, Corona, Verso, Yaris

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}