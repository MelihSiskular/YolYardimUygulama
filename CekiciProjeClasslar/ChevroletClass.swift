import Foundation

class Chevrolet:Otomobil{
    var chevroletmodel: ChevroletModel

    init(chevroletmodel: ChevroletModel,otomarka:OtomobilMarka,arac: AracTuru, yil:Int){
        self.chevroletmodel = chevroletmodel

        super.init(otomarka: otomarka, arac: arac, yil: yil)
    }
}

enum ChevroletModel{
    case Aveo, Camaro, Cruze, Kalos, Lacetti, Spark
}