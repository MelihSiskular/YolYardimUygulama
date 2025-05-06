import Foundation

class Audi:Otomobil{
    var audiModel: AudiModel
    

    init(audiModel: AudiModel, yil:String,otomodel: Any ){
        self.audiModel = audiModel

        super.init(otomarka: .Audi, arac: .otomobil, yil: yil,otomodel: otomodel)
        
    }
}
enum AudiModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case A1, A3, A4, A5, A6, A7, A8, R8, TT

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
