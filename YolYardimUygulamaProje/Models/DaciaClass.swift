import Foundation

class Dacia:Otomobil{
    var daciaModel: DaciaModel

    init(daciaModel:DaciaModel, yil:String,otomodel: Any){
        self.daciaModel = daciaModel

        super.init(otomarka: .Dacia, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum DaciaModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Lodgy, Logan, Sandero, Solenza

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
