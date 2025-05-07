import Foundation

class Land_Rover_suv:SUV{
    var landroversuvModel:LandRoverSUVModel

    init(landroversuvModel: LandRoverSUVModel, yil:String){
        self.landroversuvModel = landroversuvModel

        super.init(suvmarka: .Land_Rover_suv, arac: .suv, yil:yil)
    }
}

enum LandRoverSUVModel: String, CaseIterable, Identifiable, CustomStringConvertible{
    case Defenedr, Discovery, Ranger_Rover, Ranger_Rover_Evoque, Range_Rover_Sport, Range_Rover_Velar

    var id: String{self.rawValue}
    var description: String{
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
