import Foundation

class Mini:Otomobil{
    var miniModel:miniModel

    init(miniModel:miniModel,otomarka:OtomobilMarka,arac:AracTuru,yil:Int){
        self.miniModel = miniModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum miniModel{
    case Cooper,Cooper_clubman,Cooper_electric,John_cooper,Cooper_5
}
