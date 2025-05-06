import Foundation
class Honda:Otomobil{
    var hondaModel:HondaModel

    init(hondaModel:HondaModel,yil:String,otomodel: Any ){
        self.hondaModel = hondaModel

        super.init(otomarka:.Honda,arac: .otomobil, yil:yil,otomodel: otomodel)

    }
}
enum HondaModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case Accord,City,Civic

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
