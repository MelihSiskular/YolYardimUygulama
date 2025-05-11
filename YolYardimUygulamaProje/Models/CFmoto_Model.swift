import Foundation

class CFmoto:Motor{
    var cfmodel: CFmodel

    init(cfmodel: CFmodel, yil:String){
        self.cfmodel = cfmodel

        super.init(motormarka: .CFmoto, arac: .motor, yil:yil)
    }
}

enum CFmodel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case _150NK, _250CL_X, _250NK, _450sr

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}