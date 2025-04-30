import Foundation

class Skoda:Otomobil{
    var skodaModel : SkodaModel

    init(skodaModel: SkodaModel, yil:Int){
        self.skodaModel = skodaModel

        super.init(otomarka: .Skoda, arac: .otomobil, yil: yil)
    }
}

enum SkodaModel: String, CaseIterable, Identifiable{
    case Fabia, Favorit, Felicia, Forman, Octavia, Rapid, Roomster, Scala, Superb

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}