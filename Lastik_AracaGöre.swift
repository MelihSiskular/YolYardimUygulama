import Foundation

class ModeleGoreLastik{
    var aracTuruLastik: AracTuru
    var markaLastik: Marka
    var modelLastik: Model
    var yil : String

    init(aracTuruLastik: AracTuru, markaLastik: Marka, modelLastik: Model, yil:String){
        self.aracTuruLastik = aracTuruLastik
        self.modelLastik = modelLastik
        self.yil = yil
    } 
}