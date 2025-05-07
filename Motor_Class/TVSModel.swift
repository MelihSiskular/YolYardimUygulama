import Foundation

class TVS:Motor{
    var tvsmodel:tvsModel

    init(tvsmodel:TVSModel,yil:String){
        self.tvsmodel = tvsmodel

        super.init(motormarka:.TVS,arac:.motor,yil:yil)
    }
}
enum TVSModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case Apache_RTR_150,Apache_RTR_200,Jupiter,Jupiter_125,Ntorq_125,Raider_125

    var id:String{self.rawValue}
    var description:String{
        rawValue.replacingOccurrences(of:"_",with:" ")
    }
}