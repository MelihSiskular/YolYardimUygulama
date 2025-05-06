import Foundation
class Nissan:Otomobil{
    var nissanModel:NissanModel

    init(nissanModel:NissanModel,yil:String,otomodel: Any){
        self.nissanModel = nissanModel

        super.init(otomarka:.Nissan,arac:.otomobil,yil:yil,otomodel: otomodel)
    }
}
enum NissanModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case Almera,CT_R,Micra,Note,Primera

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
