import Foundation

class Tofaş:Otomobil{
    var tofaşModel : TofaşModel

    init(tofaşModel: TofaşModel, yil:String,otomodel: Any){
        self.tofaşModel = tofaşModel

        super.init(otomarka: .Tofaş, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum TofaşModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Doğan, Kartal, Murat, Şahin, Şerçe

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
