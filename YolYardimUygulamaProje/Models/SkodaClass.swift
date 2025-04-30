import Foundation

class Skoda:Otomobil{
    var skodaModel : SkodaModel

    init(skodaModel: SkodaModel, otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.skodaModel = skodaModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum SkodaModel{
    case Fabia, Favorit, Felicia, Forman, Octavia, Rapid, Roomster, Scala, Superb
}


