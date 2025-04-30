import Foundation

class Suzuki:Otomobil{
    var suzukiModel: SuzukiModel

    init(suzukiModel: SuzukiModel, yil:Int){
        self.suzukiModel = suzukiModel

        super.init(otomarka: .Suzuki, arac: .otomobil, yil: yil)
    }
}

enum SuzukiModel: String, CaseIterable, Identifiable{
    case Alto, Swift, SX4, Maruti
    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}