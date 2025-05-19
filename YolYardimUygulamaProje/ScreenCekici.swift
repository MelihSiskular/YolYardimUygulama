//
//  ScreenCekici.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import CoreLocation

struct ScreenCekici: View {
    
    @State var secilenKategori: AracTuru? = nil
    
    @State private var secilenMarkaOtomobil: OtomobilMarka? = nil
    @State private var secilenMarkaSuv : SUVMarka? = nil
    @State private var secilenMarkaMotor : MotorMarka? = nil
    
    @State private var secilenModelAlfa: AlfaModel? = nil
    @State private var secilenModelAudi: AudiModel? = nil
    @State private var secilenModelBmw: BMWModel? = nil
    @State private var secilenModelChevro: ChevroletModel? = nil
    @State private var secilenModelCitroen: CitroenModel? = nil
    @State private var secilenModelCupra: CupraModel? = nil
    @State private var secilenModelDacia: DaciaModel? = nil
    @State private var secilenModelDS: DS_AutomobilesModel? = nil
    @State private var secilenModelFiat: FiatModel? = nil
    @State private var secilenModelFord: FordModel? = nil
    @State private var secilenModelHonda: HondaModel? = nil
    @State private var secilenModelHyundai: HyundaiModel? = nil
    @State private var secilenModelKia: KiaModel? = nil
    @State private var secilenModelMazda: MazdaModel? = nil
    @State private var secilenModelMercedes: Mercedes_benzModel? = nil
    @State private var secilenModelMini: MiniModel? = nil
    @State private var secilenModelMishubishi: MitshubishiModel? = nil
    @State private var secilenModelNissan: NissanModel? = nil
    @State private var secilenModelOpel: OpelModel? = nil
    @State private var secilenModelPeugeot: PeugeotModel? = nil
    @State private var secilenModelPorsche: PorscheModel? = nil
    @State private var secilenModelRenault: RenaultModel? = nil
    @State private var secilenModelSeat: SeatModel? = nil
    @State private var secilenModelSkoda: SkodaModel? = nil
    @State private var secilenModelSubaru: SubaruModel? = nil
    @State private var secilenModelSuzuki: SuzukiModel? = nil
    @State private var secilenModelTesla: TeslaModel? = nil
    @State private var secilenModelTofas: TofaşModel? = nil
    @State private var secilenModelToyota: ToyotaModel? = nil
    @State private var secilenModelVolkswagen: VolkswagenModel? = nil
    @State private var secilenModelVolvo: VolvoModel? = nil
    @State private var secilenModelOtomobil: Any? = nil
    @State var secilenModelOtomobilDeneme: String = ""

    @State private var secilenModelAudiSuv: AudiSUVModel? = nil
    @State private var secilenModelBmwSuv: BMWSUVModel? = nil
    @State private var secilenModelCherrySuv: CherySUVModel? = nil
    @State private var secilenModelCHevroletSuv: ChevroletModel? = nil
    @State private var secilenModelCitoenSuv: CitroenSUVModel? = nil
    @State private var secilenModelCupraSuv: CupraSUVModel? = nil
    @State private var secilenModelDaciaSuv: DaciaSUVModel? = nil
    @State private var secilenModelFiatSuv:FiatSUVModel? = nil
    @State private var secilenModelFordSuv: FordSUVModel? = nil
    @State private var secilenModelHondaSuv: HondaSUVModel? = nil
    @State private var secilenModelHyındaiSuv: HyundaiSUVModel? = nil
    @State private var secilenModelJeepSuv: JeepSUVModel? = nil
    @State private var secilenModelKiaSuv: KiaSUVModel? = nil
    @State private var secilenModelLandRoverSuv: LandRoverSUVModel? = nil
    @State private var secilenModelMercedesSuv: Mercedes_benzSUVModel? = nil
    @State private var secilenModelMitsubishiSuv: MitsubishiSUVModel? = nil
    @State private var secilenModelNissanSuv: NissanSUVModel? = nil
    @State private var secilenModelOpelSuv: OpelSUVModel? = nil
    @State private var secilenModelPeugotSuv: PeugeotSUVModel? = nil
    @State private var secilenModelPorsheSuv: PorscheModel? = nil
    @State private var secilenModelRenaultSuv: RenaultSUVModel? = nil
    @State private var secilenModelSeatSuv: SeatSUVModel? = nil
    @State private var secilenModelSkodaSuv: SkodaSUVModel? = nil
    @State private var secilenModelSuzukiSuv: SuzukiSUVModel? = nil
    @State private var secilenModelToggSuv: ToggSUVModel? = nil
    @State private var secilenModelToyotaSuv: ToyotaSUVModel? = nil
    @State private var secilenModelVolkswagenSuv: VolkswagenSUVModel? = nil
    @State private var secilenModelVolvoSuv: VolvoSUVModel? = nil
    @State private var secilenModelSuv: Any? = nil
    @State private var secilenModelSuvDeneme: String = ""
    
    @State private var secilenModelArora: AroraModel? = nil
    @State private var secilenModelBajaj: BajajModel? = nil
    @State private var secilenModelCFmoto: CFmodel? = nil
    @State private var secilenModelHondaMoto: HondaMotoModel? = nil
    @State private var secilenModelKuba: KubaModel? = nil
    @State private var secilenModelMondial: MondialModel? = nil
    @State private var secilenModelRKS: RKSModel? = nil
    @State private var secilenModelSYM: SYMModel? = nil
    @State private var secilenModelTVS: TVSModel? = nil
    @State private var secilenModelVespa: VespaModel? = nil
    @State private var secilenModelYamaha: YamahaModel? = nil
    @State private var secilenModelMotor: Any? = nil
    @State private var secilenModelMotorDeneme: String = ""


    @State var secilenYil: String? = nil



    @State var user = User.current
    

    @Environment(\.dismiss) var dismiss

    
    @State private var isShowLocationScreen = false
    @State private var isShowMainUsers = false

    
    @StateObject private var locationManager = LocationManager()
    @State var longitudeAnlık: Double = 0.0
    @State var latitudeAnlık: Double = 0.0
    @State private var locationCity = ""
    
    let yillar = (1995...2025).map { $0 }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                
                VStack(spacing: 30) {
                    Text("Çekici Yardım")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Araç Bilgileri")
                            .font(.title.bold())
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        RoundedRectangle(cornerRadius: 1)
                            .frame(height: 1)
                            .opacity(0.4)
                    }
                    
                    enumPicker("Kategori", selection: $secilenKategori)
                        .onChange(of: secilenKategori){ _,_ in
                            deleteModelsOtomobil()
                            deleteModelsSuv()
                            deleteModelsMoto()
                            print("asdasd")
                        }
                    
                    
                    switch secilenKategori {
                    case .otomobil:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)
                           
                        switch secilenMarkaOtomobil {
                        case .Alfa_Romeo:
                            enumPicker("Model", selection: $secilenModelAlfa)
                                .onChange(of: secilenModelAlfa) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                   
                                }
                        case .Audi:
                            enumPicker("Model", selection: $secilenModelAudi)
                                .onChange(of: secilenModelAudi) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .BMW:
                            enumPicker("Model", selection: $secilenModelBmw)
                                .onChange(of: secilenModelBmw) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Chevrolet:
                            enumPicker("Model", selection: $secilenModelChevro)
                                .onChange(of: secilenModelChevro) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Citroen:
                            enumPicker("Model", selection: $secilenModelCitroen)
                                .onChange(of: secilenModelCitroen) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Cupra:
                            enumPicker("Model", selection: $secilenModelCupra)
                                .onChange(of: secilenModelCupra) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Dacia:
                            enumPicker("Model", selection: $secilenModelDacia)
                                .onChange(of: secilenModelDacia) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .DS_Automobiles:
                            enumPicker("Model", selection: $secilenModelDS)
                                .onChange(of: secilenModelDS) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Fiat:
                            enumPicker("Model", selection: $secilenModelFiat)
                                .onChange(of: secilenModelFiat) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Ford:
                            enumPicker("Model", selection: $secilenModelFord)
                                .onChange(of: secilenModelFord) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Honda:
                            enumPicker("Model", selection: $secilenModelHonda)
                                .onChange(of: secilenModelHonda) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Hyundai:
                            enumPicker("Model", selection: $secilenModelHyundai)
                                .onChange(of: secilenModelHyundai) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Kia:
                            enumPicker("Model", selection: $secilenModelKia)
                                .onChange(of: secilenModelKia) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .Mazda:
                            enumPicker("Model", selection: $secilenModelMazda)
                                .onChange(of: secilenModelMazda) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Mercedes_Benz):
                            enumPicker("Model", selection: $secilenModelMercedes)
                                .onChange(of: secilenModelMercedes) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Mini):
                            enumPicker("Model", selection: $secilenModelMini)
                                .onChange(of: secilenModelMini) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Mitsubishi):
                            enumPicker("Model", selection: $secilenModelMishubishi)
                                .onChange(of: secilenModelMishubishi) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Nissan):
                            enumPicker("Model", selection: $secilenModelNissan)
                                .onChange(of: secilenModelNissan) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Opel):
                            enumPicker("Model", selection: $secilenModelOpel)
                                .onChange(of: secilenModelOpel) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Peugeot):
                            enumPicker("Model", selection: $secilenModelPeugeot)
                                .onChange(of: secilenModelPeugeot) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Porsche):
                            enumPicker("Model", selection: $secilenModelPorsche)
                                .onChange(of: secilenModelPorsche) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Renault):
                            enumPicker("Model", selection: $secilenModelRenault)
                                .onChange(of: secilenModelRenault) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Seat):
                            enumPicker("Model", selection: $secilenModelSeat)
                                .onChange(of: secilenModelSeat) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Skoda):
                            enumPicker("Model", selection: $secilenModelSkoda)
                                .onChange(of: secilenModelSkoda) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Subaru):
                            enumPicker("Model", selection: $secilenModelSubaru)
                                .onChange(of: secilenModelSubaru) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Suzuki):
                            enumPicker("Model", selection: $secilenModelSuzuki)
                                .onChange(of: secilenModelSuzuki) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Tesla):
                            enumPicker("Model", selection: $secilenModelTesla)
                                .onChange(of: secilenModelTesla) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Tofaş):
                            enumPicker("Model", selection: $secilenModelTofas)
                                .onChange(of: secilenModelTofas) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Toyota):
                            enumPicker("Model", selection: $secilenModelToyota)
                                .onChange(of: secilenModelToyota) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Volkswagen):
                            enumPicker("Model", selection: $secilenModelVolkswagen)
                                .onChange(of: secilenModelVolkswagen) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case .some(.Volvo):
                            enumPicker("Model", selection: $secilenModelVolvo)
                                .onChange(of: secilenModelVolvo) { _, new in
                                    secilenModelOtomobil = new
                                    if let model = new {
                                        secilenModelOtomobilDeneme = model.rawValue
                                    }
                                }
                        case nil:
                            EmptyView()

                            
                      
                        }
                        
                    case .motor:
                        enumPicker("Marka", selection:  $secilenMarkaMotor)
                        
                        switch secilenMarkaMotor{
                        case .Arora:
                            enumPicker("Model", selection: $secilenModelArora)
                                .onChange(of: secilenModelArora) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Kuba:
                            enumPicker("Model", selection: $secilenModelKuba)
                                .onChange(of: secilenModelKuba) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Bajaj:
                            enumPicker("Model", selection: $secilenModelBajaj)
                                .onChange(of: secilenModelBajaj) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .CFmoto:
                            enumPicker("Model", selection: $secilenModelCFmoto)
                                .onChange(of: secilenModelCFmoto) { _, new in
                                    secilenModelMotor = new
                                    if let model = new {
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Hondamoto:
                            enumPicker("Model", selection: $secilenModelHondaMoto)
                                .onChange(of: secilenModelHondaMoto) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Mondial:
                            enumPicker("Model", selection: $secilenModelMondial)
                                .onChange(of: secilenModelMondial){ _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .RKS:
                            enumPicker("Model", selection: $secilenModelRKS)
                                .onChange(of: secilenModelRKS) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .SYM:
                            enumPicker("Model", selection: $secilenModelSYM)
                                .onChange(of: secilenModelSYM) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .TVS:
                            enumPicker("Model", selection: $secilenModelTVS)
                                .onChange(of: secilenModelTVS) { _, new in
                                    secilenModelMotor = new
                                    if let model = new {
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Vespa:
                            enumPicker("Model", selection: $secilenModelVespa)
                                .onChange(of: secilenModelVespa) { _, new in
                                    secilenModelMotor = new
                                    if let model = new {
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case .Yamaha:
                            enumPicker("Model", selection: $secilenModelYamaha)
                                .onChange(of: secilenModelYamaha) { _, new in
                                    secilenModelMotor = new
                                    if let model = new{
                                        secilenModelMotorDeneme = model.rawValue
                                    }
                                }
                        case nil:
                            EmptyView()
                        }
                        
                        
                    case .suv:
                        enumPicker("Marka", selection: $secilenMarkaSuv)
                           
                        
                        switch secilenMarkaSuv {
                        case .Audi_suv:
                            enumPicker("Model", selection: $secilenModelAudiSuv)
                                .onChange(of: secilenModelAudiSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .BMW_suv:
                            enumPicker("Model", selection: $secilenModelBmwSuv)
                                .onChange(of: secilenModelBmwSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .Chery_suv:
                            enumPicker("Model", selection: $secilenModelCherrySuv)
                                .onChange(of: secilenModelCherrySuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .Chevrolet_suv:
                            enumPicker("Model", selection: $secilenModelCHevroletSuv)
                                .onChange(of: secilenModelCHevroletSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .Citroen_suv:
                            enumPicker("Model", selection: $secilenModelCitoenSuv)
                                .onChange(of: secilenModelCitoenSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                            
                        case .Cupra_suv:
                            enumPicker("Model", selection: $secilenModelCupraSuv)
                                .onChange(of: secilenModelCupraSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Dacia_suv):
                            enumPicker("Model", selection: $secilenModelDaciaSuv)
                                .onChange(of: secilenModelDaciaSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Fiat_suv):
                            enumPicker("Model", selection: $secilenModelFiatSuv)
                                .onChange(of: secilenModelFiatSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Ford_suv):
                            enumPicker("Model", selection: $secilenModelFordSuv)
                                .onChange(of: secilenModelFordSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Honda_suv):
                            enumPicker("Model", selection: $secilenModelHondaSuv)
                                .onChange(of: secilenModelHondaSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Hyundai_suv):
                            enumPicker("Model", selection: $secilenModelHyındaiSuv)
                                .onChange(of: secilenModelHyındaiSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Jeep_suv):
                            enumPicker("Model", selection: $secilenModelJeepSuv)
                                .onChange(of: secilenModelJeepSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Kia_suv):
                            enumPicker("Model", selection: $secilenModelKiaSuv)
                                .onChange(of: secilenModelKiaSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Land_Rover_suv):
                            enumPicker("Model", selection: $secilenModelLandRoverSuv)
                                .onChange(of: secilenModelLandRoverSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Mercedes_Benz_suv):
                            enumPicker("Model", selection: $secilenModelMercedesSuv)
                                .onChange(of: secilenModelMercedesSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Mitsubishi_suv):
                            enumPicker("Model", selection: $secilenModelMitsubishiSuv)
                                .onChange(of: secilenModelMitsubishiSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Nissan_suv):
                            enumPicker("Model", selection: $secilenModelNissanSuv)
                                .onChange(of: secilenModelNissanSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Opel_suv):
                            enumPicker("Model", selection: $secilenModelOpelSuv)
                                .onChange(of: secilenModelOpelSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Peugeot_suv):
                            enumPicker("Model", selection: $secilenModelPeugotSuv)
                                .onChange(of: secilenModelPeugotSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Porsche_suv):
                            enumPicker("Model", selection: $secilenModelPorsheSuv)
                                .onChange(of: secilenModelPorsheSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Renault_suv):
                            enumPicker("Model", selection: $secilenModelRenaultSuv)
                                .onChange(of: secilenModelRenaultSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Seat_suv):
                            enumPicker("Model", selection: $secilenModelSeatSuv)
                                .onChange(of: secilenModelSeatSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Skoda_suv):
                            enumPicker("Model", selection: $secilenModelSkodaSuv)
                                .onChange(of: secilenModelSkodaSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Suzuki_suv):
                            enumPicker("Model", selection: $secilenModelSuzukiSuv)
                                .onChange(of: secilenModelSuzukiSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Togg_suv):
                            enumPicker("Model", selection: $secilenModelToggSuv)
                                .onChange(of: secilenModelToggSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Toyota_suv):
                            enumPicker("Model", selection: $secilenModelToyotaSuv)
                                .onChange(of: secilenModelToyotaSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Volkswagen_suv):
                            enumPicker("Model", selection: $secilenModelVolkswagenSuv)
                                .onChange(of: secilenModelVolkswagenSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case .some(.Volvo_suv):
                            enumPicker("Model", selection: $secilenModelVolvoSuv)
                                .onChange(of: secilenModelVolvoSuv) { _, new in
                                    secilenModelSuv = new
                                    if let model = new {
                                        secilenModelSuvDeneme = model.rawValue
                                    }
                                }
                        case nil:
                            EmptyView()
                        }
                        
                    case nil:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)
                            .disabled(true)
                      
                        
                        
                    }
                    
                    
                    if (secilenMarkaOtomobil == nil && secilenMarkaSuv == nil && secilenMarkaMotor == nil) {
                        enumPicker("Model", selection: $secilenModelVolvoSuv)
                            .disabled(true)
                           
                    }else {
                        EmptyView()
                    }
                    
                    
                    
                    
                    
                    
                    customPicker("Yıl", selection: $secilenYil, options: yillar.map{"\($0)"})
                        .disabled(!isModelSelected(for: secilenMarkaOtomobil) && !isSuvModelSelected(for: secilenMarkaSuv) && !isMotoModelSelected(for: secilenMarkaMotor))
                        .tint(.white)
                    
                    
                    
                    Spacer()
                    
                    // DEVAM ET BUTONU
                    Button(action: {
                        // Seçimlere göre işlem
                        guard let konum = locationManager.currentLocation else { return }
                        latitudeAnlık = Double(konum.latitude)
                        longitudeAnlık = Double(konum.longitude)

                        print("Konum: \(konum.latitude), \(konum.longitude)")
                        
                        sehirBul(latitude: konum.latitude, longitude: konum.longitude) { value in
                            if let value = value {
                                print(value)
                                locationCity = value
                            }
                        }
                        isShowLocationScreen = true
                      
                        
                    }) {
                        Text("Devam Et")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 1.0, green: 0.6, blue: 0.0),
                                        Color(red: 0.1, green: 0.1, blue: 0.2)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(14)
                            .shadow(radius: 4)
                        
                    }
                    .navigationDestination(isPresented: $isShowLocationScreen) {
                        //MARK: KATEGORİYE GÖRE LOCATION EKRANINA GEÇİŞ
                        if(secilenMarkaOtomobil != nil) {
                            ScreenLocationForCekici(kullanici: $user,
                                                    kategori: $secilenKategori,
                                                    markaOtomobil: $secilenMarkaOtomobil,
                                                    markaSuv: $secilenMarkaSuv,
                                                    markaMotor: $secilenMarkaMotor,
                                                    model: $secilenModelOtomobil,
                                                    secilenModel: $secilenModelOtomobilDeneme,
                                                    yil: $secilenYil,
                                                    longitudeAnlık: $longitudeAnlık,
                                                    latitudeAnlık: $latitudeAnlık)
                        }else if (secilenMarkaSuv != nil) {
                            ScreenLocationForCekici(kullanici: $user,
                                                    kategori: $secilenKategori,
                                                    markaOtomobil: $secilenMarkaOtomobil,
                                                    markaSuv: $secilenMarkaSuv,
                                                    markaMotor: $secilenMarkaMotor,
                                                    model: $secilenModelSuv,
                                                    secilenModel: $secilenModelSuvDeneme,
                                                    yil: $secilenYil,
                                                    longitudeAnlık: $longitudeAnlık,
                                                    latitudeAnlık: $latitudeAnlık)
                        }else if (secilenMarkaMotor != nil) {
                            ScreenLocationForCekici(kullanici: $user,
                                                    kategori: $secilenKategori,
                                                    markaOtomobil: $secilenMarkaOtomobil,
                                                    markaSuv: $secilenMarkaSuv,
                                                    markaMotor: $secilenMarkaMotor,
                                                    model: $secilenModelMotor,
                                                    secilenModel: $secilenModelMotorDeneme,
                                                    yil: $secilenYil,
                                                    longitudeAnlık: $longitudeAnlık,
                                                    latitudeAnlık: $latitudeAnlık)
                        }
                       
                        
                    }
                 
                    .navigationBarBackButtonHidden()
                  
                    .disabled( // Buton devre dışı mı?
//                        secilenKategori == nil ||
//                        secilenMarkaOtomobil == nil ||
//                        secilenYil == nil ||
//                        ( isModelSelected(for: secilenMarkaOtomobil) ||
//                        isSuvModelSelected(for: secilenMarkaSuv))
                        secilenYil == nil
                    )
                    .opacity(
                        (secilenYil == nil) ? 0.5 : 1.0
                    )
                    .padding(.horizontal)
                    
                    Spacer()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("asd")
                            isShowMainUsers.toggle()
                        }) {
                            Label("Geri", systemImage: "chevron.left")
                        }
                        .navigationDestination(isPresented: $isShowMainUsers) {
                            ScreenPanelForUsers()
                        }
                        .disabled(false)
                    }
                }

                
                
                
                .padding()
            }
        }
      
    }
 
    
    func isModelSelected(for marka: OtomobilMarka?) -> Bool {
        switch marka {
        case .Alfa_Romeo: return secilenModelAlfa != nil
        case .Audi: return secilenModelAudi != nil
        case .BMW: return secilenModelBmw != nil
        case .Chevrolet: return secilenModelChevro != nil
        case .Citroen: return secilenModelCitroen != nil
        case .Cupra: return secilenModelCupra != nil
        case .Dacia: return secilenModelDacia != nil
        case .DS_Automobiles: return secilenModelDS != nil
        case .Fiat: return secilenModelFiat != nil
        case .Ford: return secilenModelFord != nil
        case .Honda: return secilenModelHonda != nil
        case .Hyundai: return secilenModelHyundai != nil
        case .Kia: return secilenModelKia != nil
        case .Mazda: return secilenModelMazda != nil
        case .Mercedes_Benz: return secilenModelMercedes != nil
        case .Mini: return secilenModelMini != nil
        case .Mitsubishi: return secilenModelMishubishi != nil
        case .Nissan: return secilenModelNissan != nil
        case .Opel: return secilenModelOpel != nil
        case .Peugeot: return secilenModelPeugeot != nil
        case .Porsche: return secilenModelPorsche != nil
        case .Renault: return secilenModelRenault != nil
        case .Seat: return secilenModelSeat != nil
        case .Skoda: return secilenModelSkoda != nil
        case .Subaru: return secilenModelSubaru != nil
        case .Suzuki: return secilenModelSuzuki != nil
        case .Tesla: return secilenModelTesla != nil
        case .Tofaş: return secilenModelTofas != nil
        case .Toyota: return secilenModelToyota != nil
        case .Volkswagen: return secilenModelVolkswagen != nil
        case .Volvo: return secilenModelVolvo != nil
        case nil: return false
        }
    }
    func isSuvModelSelected(for marka: SUVMarka?) -> Bool {
        switch marka {
        case .Audi_suv: return secilenModelAudiSuv != nil
        case .BMW_suv: return secilenModelBmwSuv != nil
        case .Chery_suv: return secilenModelCherrySuv != nil
        case .Chevrolet_suv: return secilenModelCHevroletSuv != nil
        case .Citroen_suv: return secilenModelCitoenSuv != nil
        case .Cupra_suv: return secilenModelCupraSuv != nil
        case .Dacia_suv: return secilenModelDaciaSuv != nil
        case .Fiat_suv: return secilenModelFiatSuv != nil
        case .Ford_suv: return secilenModelFordSuv != nil
        case .Honda_suv: return secilenModelHondaSuv != nil
        case .Hyundai_suv: return secilenModelHyındaiSuv != nil
        case .Jeep_suv: return secilenModelJeepSuv != nil
        case .Kia_suv: return secilenModelKiaSuv != nil
        case .Land_Rover_suv: return secilenModelLandRoverSuv != nil
        case .Mercedes_Benz_suv: return secilenModelMercedesSuv != nil
        case .Mitsubishi_suv: return secilenModelMitsubishiSuv != nil
        case .Nissan_suv: return secilenModelNissanSuv != nil
        case .Opel_suv: return secilenModelOpelSuv != nil
        case .Peugeot_suv: return secilenModelPeugotSuv != nil
        case .Porsche_suv: return secilenModelPorsheSuv != nil
        case .Renault_suv: return secilenModelRenaultSuv != nil
        case .Seat_suv: return secilenModelSeatSuv != nil
        case .Skoda_suv: return secilenModelSkodaSuv != nil
        case .Suzuki_suv: return secilenModelSuzukiSuv != nil
        case .Togg_suv: return secilenModelToggSuv != nil
        case .Toyota_suv: return secilenModelToyotaSuv != nil
        case .Volkswagen_suv: return secilenModelVolkswagenSuv != nil
        case .Volvo_suv: return secilenModelVolvoSuv != nil
        case nil: return false
        }
    }
    func isMotoModelSelected(for marka: MotorMarka?) -> Bool {
        switch marka {
        case .Arora: return secilenModelArora != nil
        case .Bajaj: return secilenModelBajaj != nil
        case .CFmoto: return secilenModelCFmoto != nil
        case .Hondamoto: return secilenModelHondaMoto != nil
        case .Kuba: return secilenModelKuba != nil
        case .Mondial: return secilenModelMondial != nil
        case .RKS: return secilenModelRKS != nil
        case .SYM: return secilenModelSYM != nil
        case .TVS: return secilenModelTVS != nil
        case .Vespa: return secilenModelVespa != nil
        case .Yamaha: return secilenModelYamaha != nil
        case nil: return false
        }
    }
    func deleteModelsMoto() {
        secilenModelMotor = nil
        secilenModelMotor = nil
        secilenModelArora = nil
        secilenModelBajaj = nil
        secilenModelCFmoto = nil
        secilenModelHondaMoto = nil
        secilenModelKuba = nil
        secilenModelMondial = nil
        secilenModelRKS = nil
        secilenModelSYM = nil
        secilenModelTVS = nil
        secilenModelVespa = nil
        secilenModelYamaha = nil
        secilenYil = nil
    }

    func deleteModelsSuv() {
        secilenMarkaSuv = nil
        secilenModelSuv = nil
        secilenModelAudiSuv = nil
        secilenModelBmwSuv = nil
        secilenModelCherrySuv = nil
        secilenModelCHevroletSuv = nil
        secilenModelCitoenSuv = nil
        secilenModelCupraSuv = nil
        secilenModelDaciaSuv = nil
        secilenModelFiatSuv = nil
        secilenModelFordSuv = nil
        secilenModelHondaSuv = nil
        secilenModelHyındaiSuv = nil
        secilenModelJeepSuv = nil
        secilenModelKiaSuv = nil
        secilenModelLandRoverSuv = nil
        secilenModelMercedesSuv = nil
        secilenModelMitsubishiSuv = nil
        secilenModelNissanSuv = nil
        secilenModelOpelSuv = nil
        secilenModelPeugotSuv = nil
        secilenModelPorsheSuv = nil
        secilenModelRenaultSuv = nil
        secilenModelSeatSuv = nil
        secilenModelSkodaSuv = nil
        secilenModelSuzukiSuv = nil
        secilenModelToggSuv = nil
        secilenModelToyotaSuv = nil
        secilenModelVolkswagenSuv = nil
        secilenModelVolvoSuv = nil
        secilenYil = nil
    }
    
    func deleteModelsOtomobil() {
        secilenMarkaOtomobil = nil
        secilenModelAlfa = nil
        secilenModelAudi = nil
        secilenModelBmw = nil
        secilenModelChevro = nil
        secilenModelCitroen = nil
        secilenModelCupra = nil
        secilenModelDacia = nil
        secilenModelDS = nil
        secilenModelFiat = nil
        secilenModelFord = nil
        secilenModelHonda = nil
        secilenModelHyundai = nil
        secilenModelKia = nil
        secilenModelMazda = nil
        secilenModelMercedes = nil
        secilenModelMini = nil
        secilenModelMishubishi = nil
        secilenModelNissan = nil
        secilenModelOpel = nil
        secilenModelPeugeot = nil
        secilenModelPorsche = nil
        secilenModelRenault = nil
        secilenModelSeat = nil
        secilenModelSkoda = nil
        secilenModelSubaru = nil
        secilenModelSuzuki = nil
        secilenModelTesla = nil
        secilenModelTofas = nil
        secilenModelToyota = nil
        secilenModelVolkswagen = nil
        secilenModelVolvo = nil
        secilenModelOtomobil = nil
        secilenYil = nil
        
    }
}

    
        
        
        func customPicker(_ title: String, selection: Binding<String?>, options: [String]) -> some View {
            let binding = Binding<String>(
                get: { selection.wrappedValue ?? "" },
                set: { selection.wrappedValue = $0.isEmpty ? nil : $0 }
            )
            
            let label = HStack {
                Text(selection.wrappedValue ?? "\(title) Seçiniz")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.white.opacity(0.7))
            }
                .padding()
                .background(Color.white.opacity(0.15))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    
                    
                )

            
            
            return Picker(selection: binding, label: label) {
                Text("\(title) Seçiniz").tag("")
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)
            

            
    }
func enumPicker<T: CaseIterable & Identifiable & Hashable & CustomStringConvertible>(
    _ title: String,
    selection: Binding<T?>
) -> some View where T.AllCases: RandomAccessCollection {
    
    let label = HStack {
        Text(selection.wrappedValue?.description ?? "\(title) Seçiniz")
            .foregroundColor(.white)
            .fontWeight(.medium)
        Spacer()
        Image(systemName: "chevron.down")
            .foregroundColor(.white.opacity(0.7))
    }
    
        .padding()
        .background(Color.white.opacity(0.15))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
    
    return Picker(selection: selection, label: label) {
        Text("\(title) Seçiniz").tag(nil as T?)
        ForEach(T.allCases, id: \.self) { option in
            Text(option.description).tag(option as T?)
        }
    }
    .tint(.white)
    .pickerStyle(.menu)
    .padding(.horizontal)
}




#Preview {
    ScreenCekici()
}
