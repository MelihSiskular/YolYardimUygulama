import Foundation

class Mini:Otomobil{
    var miniModel:MiniModel

    init(miniModel:MiniModel,yil:String,otomodel: Any){
        self.miniModel = miniModel

        super.init(otomarka:.Mini,arac:.otomobil,yil:yil,otomodel: otomodel)
    }
}
enum MiniModel:String,CaseIterable, Identifiable,CustomStringConvertible{
    case Cooper,Cooper_clubman,Cooper_electric,John_cooper,Cooper_5

     var id:String{self.rawValue}

    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
