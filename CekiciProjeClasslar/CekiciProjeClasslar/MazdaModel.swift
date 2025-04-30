import Foundation

class Mazda:Otomobil{
    var mazdaModel:MazdaModel

    init(mazdaModel:MazdaModel,yil:Int){
        self.mazdaModel = mazdaModel

        super.init(otomarka: .Mazda,arac:.otomobil,yil:yil)
    }
}
enum mazdaModel:String, CaseIterable,Identifiable{
    case _3,_325,_626
     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}