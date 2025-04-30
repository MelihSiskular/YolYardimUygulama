import Foundation
class DS_Automobiles: Otomobil{
    var dS_AutomobilesModel:DS_AutomobilesModel

    init(dS_AutomobilesModel:DS_AutomobilesModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.dS_AutomobilesModel = dS_AutomobilesModel

        super.init(otomarka:otomarka,arac:arac,yil: yil)
    
    }
}
enum DS_AutomobilesModel{
    case DS3,DS4,DS5,DS9
}
