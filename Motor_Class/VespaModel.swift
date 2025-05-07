import Foundation

class Vespa:Motor{
    var vespamodel: VespaModel

    init(vespamodel:VespaModel,yil:String){
        self.vespamodel = vespamodel

        super.init(motormarka:.Vespa,arac:.motor,yil:yil)
    }
}
enum VespaModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case GTS_300_Super,Primavera_150,Sprint_150

    var id:String{self.rawValue}
    var description:String{
        rawValue.replacingOccurrences(of:"_",with:" ")
    }
}