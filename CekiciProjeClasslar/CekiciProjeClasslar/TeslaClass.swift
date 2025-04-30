import Foundation

class Tesla:Otomobil{
    var teslaModel: TeslaModel

    init(teslaModel: TeslaModel, yil:Int){
        self.teslaModel = teslaModel

        super.init(otomarka: .Tesla, arac: .otomobil, yil: yil)
    }
}

enum TeslaModel: String, CaseIterable, Identifiable{
    case Model_3, Model_S, Model_X, Model_Y

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}