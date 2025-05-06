import Foundation
class DS_Automobiles: Otomobil{
    var dS_AutomobilesModel:DS_AutomobilesModel

    init(dS_AutomobilesModel:DS_AutomobilesModel,yil:String,otomodel: Any){
        self.dS_AutomobilesModel = dS_AutomobilesModel

        super.init(otomarka:.DS_Automobiles,arac:.otomobil,yil:yil,otomodel: otomodel)
    
    }
}
enum DS_AutomobilesModel:String, CaseIterable, Identifiable,CustomStringConvertible{
 case DS3,DS4,DS5,DS9
 var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
