import Foundation
class Hyundai:Otomobil{
    var hyundaiModel:HyundaiModel

    init(hyundaiModel:HyundaiModel,yil:Int){
        self.hyundaiModel = hyundaiModel

        super.init(otomarka:.Hyundai,arac:.otomobil, yil:yil)
    }
}
enum HyundaiModel:String, CaseIterable, Identifiable{
    case Accent,Accent_Blue,Accent_Era,Elantra,Getz,i10,I20,I30,Sonata

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}