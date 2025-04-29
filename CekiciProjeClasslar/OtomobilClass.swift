import Foundation

class Otomobil:Vasita{
    var otomarka:OtomobilMarka
    var otomodel:OtomobilModel

    init(otomarka:OtomobilMarka,otomodel:OtomobilModel,arac: AracTuru, yil:Int ){
        self.otomarka = otomarka
        self.otomodel = otomodel

        super.init(arac: arac, yil:yil)
    }
}

enum OtomobilMarka{
    case , DS_Automobiles, Fiat, Ford, Honda, Hyundai, Kia, Mazda
    ,Mercedes_Benz, Mini, Mitsubishi, Nissan, Opel, Peugeot, Porsche, Renault, Seat, Skoda, Subaru, Suzuki, Tesla, Tofaş
    , Toyota, Volkswagen, Volvo
}

enum OtomobilModel{

    case DS3, DS4, DS5, DS9
    case Albea, Bravo, _500, Egea, Linea, Marea, Palio, Panda, Punto, Tempra, Tipo, Uno
    case B_max, C_Max, Escort, Fiesta, Focus, Fusion, Mondeo, Mustang, Taunus
    case Accord, City, Civic
    case Accent, Accent_Blue, Accent_Era, Elantra, Getz, _i10, _i20, _i30, Sonata
    case Ceed, Cerato, Picanto, Rio
    case _3, _323, _626
    case A_serisi, B_serisi, C_serisi, Cla, Clk, Cls, E_serisi, EQE, EQS, S_serisi, SLK
    case Cooper, Cooper_clubman, Cooper_Electric, John_Cooper , One, Cooper_S
    case Colt, Lancer, Lancer_Evolution, Carisma
    case Almera, GT_R, Micra, Note, Primera
    case Astra, Astra_e, Corsa, Corsa_e, Insignia, Meriva, Omega, Vectra
    case _106, _107,_206, _206plus, _207, e_208, _301, _306, _307, _308, e3_08, _406, _407, _508, RCZ
    case _718, _911, Boxtrer, Cayman, Panamera, Taycan
    case Clio, Fluence, Grand_Scenic, Laguna, Latitude, Megan, Megane_E_Tech, Modus, Scenic, Symbol, Taliant, Talisman, Twingo, R_9, R_11, R_12, R_19, R_21
    case Cordoba, Ibiza, _Leon, Toledo
    case Fabia, Favorit, Felicia, Forman, Octavia, Rapid, Roomster, Scala, Superb
    case BRZ, Impreza, Legacy
    case Alto, Swift, SX4, Maruti
    case Model_3, Model_S, Model_X, Model_Y
    case Doğan, Kartal, Murat, Şahin, Şerçe
    case Auris, Avensis, Carina, Corolla, Corona, Verso, Yaris
    case Arteon, Beetle, Bora, Golf, Jetta, Passat, Passat_Variant, Polo, Scirocco, Touran, CC
    case S40, S60, S80, S90, V40, V40_Cross_Country, V90_Cross_Country
}

