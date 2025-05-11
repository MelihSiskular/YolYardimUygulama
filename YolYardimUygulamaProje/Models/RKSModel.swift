import Foundation

class RKS:Motor{
    var rksmodel: RKSModel

    init(rksmodel: RKSModel,yil:String){
        self.rksmodel = rksmodel

        super.init(motormarka:.RKS,arac:.motor,yil:yil)
        

    }

}
enum RKSModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case _125R,_125S,A_250,Arome_125,Azure_50,Bitter_50,Blackwolf_250,Blazer_50_XR,DES_125,Grage_202,Newlight_125_Pro,R_250,Spontini_110_125,Vrs_125

    var id:String{self.rawValue}
    var description:String{
        rawValue.replacingOccurrences(of:"_",with:" ")
    }
}