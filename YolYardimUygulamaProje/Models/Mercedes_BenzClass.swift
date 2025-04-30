import Foundation
class Mercedes_Benz:Otomobil{
    var mercedes_benzModel:Mercedes_benzModel

    init(mercedes_benzModel:Mercedes_benzModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.mercedes_benzModel = mercedes_benzModel

        super.init(otomarka: otomarka,arac:arac,yil:yil)
    }
}
enum Mercedes_benzModel{
    case A_serisi,B_serisi,C_serisi,Cia,Clk,Cls,E_serisi,Eqe,Eqs,S_serisi,Slk
}
