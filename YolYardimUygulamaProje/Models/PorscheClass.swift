import Foundation

class Porsche:Otomobil{
    var porscheModel: PorscheModel

    init(porscheModel: PorscheModel, yil:String,otomodel: Any){
        self.porscheModel = porscheModel

        super.init(otomarka: .Porsche, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum PorscheModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case _718, _911, Boxtrer, Cayman, Panamera, Taycan

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
