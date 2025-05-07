import Foundation

class SYM:Motor{
    var symmodel: SYMModel

    init(symmodel: SYMModel,yil:String){
        self.symmodel = symmodel

        super.init(motormarka:.RKS,arac:.motor,yil:yil)

    }
}

enum SYMModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case ADX_125,Fiddle_III_125,Fiddle_IV_125,Jet_14_200i_ABS,Jet_X_125,Joymax_250i

    var id:String{self.rawValue}
    var description:String{
        rawValue.replacingOccurrsences(of:"_",with:" ")
    }
 
}