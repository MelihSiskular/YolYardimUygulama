import Foundation

class Audi:Otomobil{
    var audiModel: AudiModel

    init(audiModel: AudiModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int ){
        self.audiModel = audiModel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}
enum AudiModel{
    case A1, A3, A4, A5, A6, A7, A8, R8, TT
}