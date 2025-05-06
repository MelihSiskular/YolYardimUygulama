import Foundation
class Hyundai:Otomobil{
    var hyundaiModel:HyundaiModel

    init(hyundaiModel:HyundaiModel,yil:String,otomodel: Any){
        self.hyundaiModel = hyundaiModel

        super.init(otomarka:.Hyundai,arac:.otomobil, yil:yil,otomodel: otomodel)
    }
}
enum HyundaiModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case Accent,Accent_Blue,Accent_Era,Elantra,Getz,i10,I20,I30,Sonata

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
