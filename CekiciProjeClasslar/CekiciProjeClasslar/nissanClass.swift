import Foundation
class Nissan:Otomobil{
    var nissanModel:NissanModel

    init(nissanModel:NissanModel,yil:Int){
        self.nissanModel = nissanModel

        super.init(otomarka:.Nissan,arac:.otomobil,yil:yil)
    }
}
enum NissanModel:String, CaseIterable, Identifiable{
    case Almera,CT_R,Micra,Note,Primera

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}