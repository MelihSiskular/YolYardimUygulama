import Foundation

class Yamaha:Motor{
    var yamahamodel:YamahaModel 

    init(yamahamodel:YamahaModel,yil:String){
        self.yamahamodel = yamahamodel

        super.init(motormarka:.Yamaha,arac:.motor,yil:yil)

    }
}
enum YamahaModel:String,CaseIterable,Identifiable,CustomStringConvertible{
    case R_7,Crypton,D_light,MT_07,MT_09,MT_10,MT_125,MT_25,N_Max_125,N_Max_155,RayZR,Tracer,X_Max_125,X_Max_250,X_Max_300,X_Max_400,YZF_R1,YZF_R25,YZF_R6

    var id:String{self.rawValue}
    var descriotion:String{
        rawValue.replacingOccurrences(of:"_",with:" ")
    }

}