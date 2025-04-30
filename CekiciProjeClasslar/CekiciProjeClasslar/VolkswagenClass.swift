import Foundation

class Volkswagen:Otomobil{
    var volkswagenModel: VolkswagenModel

    init(volkswagenModel: VolkswagenModel, yil:Int){
        self.volkswagenModel = volkswagenModel

        super.init(otomarka: .Volkswagen, arac: .otomobil, yil: yil)
    }
}

enum VolkswagenModel: String, CaseIterable, Identifiable{
    case Arteon, Beetle, Bora, Golf, Jetta, Passat, Passat_Variant, Polo, Scirocco, Touran, CC

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}