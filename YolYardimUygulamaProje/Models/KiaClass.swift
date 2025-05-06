import Foundation

class Kia:Otomobil{
    var kiaModel:KiaModel

    init(kiaModel:KiaModel,yil:String,otomodel: Any){
        self.kiaModel = kiaModel

        super.init(otomarka:.Kia, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}
enum KiaModel:String , CaseIterable, Identifiable,CustomStringConvertible{
    case Ceed,Cerato,Picanto,Rio
     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
