import Foundation

class Tesla:Otomobil{
    var teslaModel: TeslaModel

    init(teslaModel: TeslaModel, yil:String,otomodel: Any){
        self.teslaModel = teslaModel

        super.init(otomarka: .Tesla, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum TeslaModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Model_3, Model_S, Model_X, Model_Y

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
