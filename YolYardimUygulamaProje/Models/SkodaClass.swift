import Foundation

class Skoda:Otomobil{
    var skodaModel : SkodaModel

    init(skodaModel: SkodaModel, yil:String,otomodel: Any){
        self.skodaModel = skodaModel

        super.init(otomarka: .Skoda, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum SkodaModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Fabia, Favorit, Felicia, Forman, Octavia, Rapid, Roomster, Scala, Superb

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
