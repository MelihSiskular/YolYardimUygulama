import Foundation

class Chevrolet:Otomobil{
    var chevroletmodel: ChevroletModel

    init(chevroletmodel: ChevroletModel, yil:String,otomodel: Any){
        self.chevroletmodel = chevroletmodel

        super.init(otomarka: .Chevrolet, arac: .otomobil, yil: yil,otomodel: otomodel)
    }
}

enum ChevroletModel: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Aveo, Camaro, Cruze, Kalos, Lacetti, Spark

    var id: String {self.rawValue}
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
