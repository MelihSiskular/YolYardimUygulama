import Foundation

class Volkswagen:Otomobil{
    var volkswagenModel: VolkswagenModel

    init(volkswagenModel: VolkswagenModel, yil:String,otomodel: Any){
        self.volkswagenModel = volkswagenModel

        super.init(otomarka: .Volkswagen, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum VolkswagenModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Arteon, Beetle, Bora, Golf, Jetta, Passat, Passat_Variant, Polo, Scirocco, Touran, CC

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
