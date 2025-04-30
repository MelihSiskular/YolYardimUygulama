import Foundation

class Tofaş:Otomobil{
    var tofaşModel : TofaşModel

    init(tofaşModel: TofaşModel, yil:Int){
        self.tofaşModel = tofaşModel

        super.init(otomarka: .Tofaş, arac: .otomobil, yil: yil)
    }
}

enum TofaşModel: String, CaseIterable, Identifiable{
    case Doğan, Kartal, Murat, Şahin, Şerçe

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}