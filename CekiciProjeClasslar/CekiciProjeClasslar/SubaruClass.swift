import Foundation

class Subaru:Otomobil{
    var subaruModel: SubaruModel

    init(subaruModel: SubaruModel, yil:Int){
        self.subaruModel = subaruModel

        super.init(otomarka: .Subaru, arac: .otomobil, yil: yil)
    }
}

enum SubaruModel: String, CaseIterable, Identifiable{
    case BRZ, Impreza, Legacy

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}