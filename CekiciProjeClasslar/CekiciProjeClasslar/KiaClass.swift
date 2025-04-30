import Foundation

class Kia:Otomobil{
    var kiaModel:KiaModel

    init(KiaModel:KiaModel,yil:Int){
        self.kiaModel = kiaModel

        super.init(otomarka:.Kia, arac: .otomobil, yil: yil)
    }
}
enum KiaModel:String , CaseIterable, Identifiable{
    case Ceed,Cerato,Picanto,Rio
     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}