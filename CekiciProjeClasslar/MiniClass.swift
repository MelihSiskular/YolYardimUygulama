import Foundation

class Mini:otomobil{
    var miniModel:miniModel

    init(miniModel:miniModel,otomarka:OtomobilMarka,arac:aracTuru,yil:yil){
        self.miniModel = miniModel

        super.init(otomarka:otomarka,arac:arac,yil:yil)
    }
}
enum miniModel{
    case Cooper,Cooper_clubman,Cooper_electric,John_cooper,Cooper_5
}