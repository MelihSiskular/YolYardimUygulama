import Foundation

class Citroen:Otomobil{
    var citroenmodel: CitroenModel

    init(citroenmodel: CitroenModel, yil:Int){
        self.citroenmodel = citroenmodel

        super.init(otomarka: .Citroen, arac: .otomobil, yil: yil)
    }
}

enum CitroenModel: String, CaseIterable, Identifiable{
    case C_Elysée, C3, C4, C5

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}