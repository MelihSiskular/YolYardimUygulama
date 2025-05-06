import Foundation

class Mazda:Otomobil{
    var mazdaModel:MazdaModel

    init(mazdaModel:MazdaModel,yil:String,otomodel: Any){
        self.mazdaModel = mazdaModel

        super.init(otomarka: .Mazda,arac:.otomobil,yil:yil,otomodel: otomodel)
    }
}
enum MazdaModel:String, CaseIterable,Identifiable,CustomStringConvertible{
    case _3,_325,_626
     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
