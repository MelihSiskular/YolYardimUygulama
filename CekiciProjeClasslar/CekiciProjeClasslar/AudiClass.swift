import Foundation

class Audi:Otomobil{
    var audiModel: AudiModel

    init(audiModel: AudiModel, yil:Int ){
        self.audiModel = audiModel

        super.init(otomarka: .Audi, arac: .otomobil, yil: yil)
    }
}
enum AudiModel: String, CaseIterable, Identifiable{
    case A1, A3, A4, A5, A6, A7, A8, R8, TT

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}