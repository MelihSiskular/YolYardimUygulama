import Foundation

class Alfa_Romeo:Otomobil{
    var alfaModel: AlfaModel

    init(alfaModel: AlfaModel, yil:String,otomodel: Any ){
        self.alfaModel = alfaModel

        super.init(otomarka: .Alfa_Romeo, arac: .otomobil, yil: yil,otomodel: otomodel)
        
    }
}
enum AlfaModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Giulietta, _156, _159

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
