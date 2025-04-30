import Foundation

class Chevrolet:Otomobil{
    var chevroletmodel: ChevroletModel

    init(chevroletmodel: ChevroletModel, yil:Int){
        self.chevroletmodel = chevroletmodel

        super.init(otomarka: .Chevrolet, arac: .otomobil, yil: yil)
    }
}

enum ChevroletModel: String, CaseIterable, Identifiable{
    case Aveo, Camaro, Cruze, Kalos, Lacetti, Spark

    var id: String {self.rawValue}
    var displayName: String{
        self.rawValue.replacingOccurrences(of: "_", with: " ")
    }
}