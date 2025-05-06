import Foundation

class Subaru:Otomobil{
    var subaruModel: SubaruModel

    init(subaruModel: SubaruModel, yil:String,otomodel: Any){
        self.subaruModel = subaruModel

        super.init(otomarka: .Subaru, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum SubaruModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case BRZ, Impreza, Legacy

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
