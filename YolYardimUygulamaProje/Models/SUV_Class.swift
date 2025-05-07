import Foundation

class SUV:Vasita{
    var suvmarka:SUVMarka

    init(suvmarka: SUVMarka,arac: AracTuru, yil:String){
        self.suvmarka = suvmarka

        super.init(arac: arac, yil:yil)
    }
}

enum SUVMarka: String, CaseIterable, Identifiable,CustomStringConvertible{
    case Audi_suv, BMW_suv, Chery_suv, Chevrolet_suv, Citroen_suv
    , Cupra_suv , Dacia_suv, Fiat_suv, Ford_suv, Honda_suv, Hyundai_suv
    , Jeep_suv, Kia_suv, Land_Rover_suv ,Mercedes_Benz_suv, Mitsubishi_suv
    , Nissan_suv, Opel_suv, Peugeot_suv, Porsche_suv, Renault_suv, Seat_suv
    , Skoda_suv, Suzuki_suv, Togg_suv, Toyota_suv, Volkswagen_suv, Volvo_suv
    
    var id: String { self.rawValue }
    
    
    var description: String {
        rawValue.replacingOccurrences(of: "_", with: " ")
    }
}
