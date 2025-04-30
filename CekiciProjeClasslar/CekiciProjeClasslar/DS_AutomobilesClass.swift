import Foundation
class DS_Automobiles: Otomobil{
    var dS_AutomobilesModel:DS_AutomobilesModel

    init(dS_AutomobilesModel:DS_AutomobilesModel,yil:Int){
        self.dS_AutomobilesModel = dS_AutomobilesModel

        super.init(otomarka:.DS_Automobiles,arac:.otomobil,yil:yil)
    
    }
}
enum DS_AutomobilesModel:String, CaseIterable, Identifiable{
 case DS3,DS4,DS5,DS9
 var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
 }
}