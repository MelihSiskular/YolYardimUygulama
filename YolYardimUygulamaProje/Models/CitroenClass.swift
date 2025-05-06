import Foundation

class Citroen:Otomobil{
    var citroenmodel: CitroenModel

    init(citroenmodel: CitroenModel, yil:String,otomodel: Any){
        self.citroenmodel = citroenmodel

        super.init(otomarka: .Citroen, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum CitroenModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case C_Elysée, C3, C4, C5

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
