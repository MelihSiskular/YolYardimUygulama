import Foundation

class Peugeot:Otomobil{
    var peugeotmodel: PeugeotModel

    init(peugeotmodel: PeugeotModel, yil:Int){
        self.peugeotmodel = peugeotmodel

        super.init(otomarka: .Peugeot, arac: .otomobil, yil: yil)
    }
}

enum PeugeotModel: String, CaseIterable, Identifiable{
    case _106, _107,_206, _206plus, _207, e_208, _301, _306, _307, _308, e3_08, _406, _407, _508, RCZ

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}