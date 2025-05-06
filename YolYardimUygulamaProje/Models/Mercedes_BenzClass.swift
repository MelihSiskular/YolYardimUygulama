import Foundation
class Mercedes_Benz:Otomobil{
    var mercedes_benzModel: Mercedes_benzModel

    init(mercedes_benzModel:Mercedes_benzModel,yil:String,otomodel: Any){
        self.mercedes_benzModel = mercedes_benzModel

        super.init(otomarka:.Mercedes_Benz,arac:.otomobil,yil:yil,otomodel: otomodel)
    }
}
enum Mercedes_benzModel:String, CaseIterable, Identifiable,CustomStringConvertible{
    case A_serisi,B_serisi,C_serisi,Cia,Clk,Cls,E_serisi,Eqe,Eqs,S_serisi,Slk
     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
