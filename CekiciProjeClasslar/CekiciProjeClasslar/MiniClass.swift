import Foundation

class Mini:otomobil{
    var miniModel:MiniModel

    init(miniModel:MiniModel,yil:yil){
        self.miniModel = miniModel

        super.init(otomarka:.Mini,arac:.otomobil,yil:yil)
    }
}
enum MiniModel:String,CaseIterable, Identifiable{
    case Cooper,Cooper_clubman,Cooper_electric,John_cooper,Cooper_5

     var id:String{self.rawValue}

 var displayName: String{
    self.rawValue.replacingOccurrences(of:"-",with:" ")
}
}