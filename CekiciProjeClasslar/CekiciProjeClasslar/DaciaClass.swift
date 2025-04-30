import Foundation

class Dacia:Otomobil{
    var daciaModel: DaciaModel

    init(daciaModel:DaciaModel, yil:Int){
        self.daciaModel = daciaModel

        super.init(otomarka: .Dacia, arac: .otomobil, yil: yil)
    }
}

enum DaciaModel: String, CaseIterable, Identifiable{
    case Lodgy, Logan, Sandero, Solenza

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}