import Foundation

class Suzuki:Otomobil{
    var suzukiModel: SuzukiModel

    init(suzukiModel: SuzukiModel, yil:String,otomodel: Any){
        self.suzukiModel = suzukiModel

        super.init(otomarka: .Suzuki, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum SuzukiModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Alto, Swift, SX4, Maruti
    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
