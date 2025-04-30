import Foundation
class Honda:Otomobil{
    var hondaModel:HondaModel

    init(hondaModel:HondaModel,yil:Int ){
        self.hondaModel = hondaModel

        super.init(otomarka:.Honda,arac: .otomobil, yil:yil)

    }
}
enum HondaModel:String, CaseIterable, Identifiable{
    case Accord,City,Civic

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}