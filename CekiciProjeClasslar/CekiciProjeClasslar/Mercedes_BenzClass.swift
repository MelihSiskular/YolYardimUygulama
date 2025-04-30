import Foundation
class Mercedes_Benz:Otomobil{
    var mercedes_benzModel: Mercedes_benzModel

    init(mercedes_benzModel:Mercedes_benzModel,yil:Int){
        self.mercedes_benzModel = mercedes_benzModel

        super.init(otomarka:.Mercedes_benz,arac:.otomobil,yil:yil)
    }
}
enum Mercedes_benzModel:String, CaseIterable, Identifiable{
    case A_serisi,B_serisi,C_serisi,Cia,Clk,Cls,E_serisi,Eqe,Eqs,S_serisi,Slk
     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}