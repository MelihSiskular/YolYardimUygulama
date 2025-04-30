import Foundation

class Alfa_Romeo:Otomobil{
    var alfaModel: AlfaModel

    init(alfaModel: AlfaModel, yil:Int ){
        self.alfaModel = alfaModel

        super.init(otomarka: .Alfa_Romeo, arac: .otomobil, yil: yil)
        
    }
}
enum AlfaModel: String, CaseIterable, Identifiable{
    case Giulietta, _156, _159

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}