import Foundation

class Kuba:Motor{
    var kubamodel: KubaModel

    init(kubamodel: KubaModel, yil:String){
        self.kubamodel = kubamodel

        super.init(motormarka: .Kuba, arac: .motor, yil:yil)
    }
}

enum KubaModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Arome_125_Pro, Azure_50_Pro, Bannry_125, Bevely_125, Blueberry, Bluebird, Brilliant_125, Superlight_125

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}