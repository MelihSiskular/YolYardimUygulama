import Foundation

class Porsche:Otomobil{
    var porscheModel: PorscheModel

    init(porscheModel: PorscheModel, yil:Int){
        self.porscheModel = porscheModel

        super.init(otomarka: .Porsche, arac: .otomobil, yil: yil)
    }
}

enum PorscheModel: String, CaseIterable, Identifiable{
    case _718, _911, Boxtrer, Cayman, Panamera, Taycan

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
