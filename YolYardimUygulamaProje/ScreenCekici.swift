//
//  ScreenCekici.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import CoreLocation

struct ScreenCekici: View {
    
    @State private var secilenKategori: AracTuru? = nil
    @State private var secilenMarkaOtomobil: OtomobilMarka? = nil
    
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
    
    @State var offer : Vasita 



    @State private var secilenYil: String? = nil
    
    @State private var isShowLocationScreen = false

    
    @StateObject private var locationManager = LocationManager()
    @State private var location = CLLocationCoordinate2D()
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

                    
                    switch secilenKategori {
                    case .otomobil:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)
                            

                    case .motor:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)

                    case .suv:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)

                    case nil:
                        enumPicker("Marka", selection: $secilenMarkaOtomobil)
                            .disabled(secilenMarkaOtomobil == nil)

                    }
                    
                    switch secilenMarkaOtomobil {
                    case .Alfa_Romeo:
                        enumPicker("Model", selection: $secilenModelAlfa)
                            .onChange(of: secilenModelAlfa) { _, new in
                                secilenModelOtomobil = new
                            }
                        
                        
                    case .Audi:
                        enumPicker("Model", selection: $secilenModelAudi)
                            .onChange(of: secilenModelAudi) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .BMW:
                        enumPicker("Model", selection: $secilenModelBmw)
                            .onChange(of: secilenModelBmw) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Chevrolet:
                        enumPicker("Model", selection: $secilenModelChevro)
                            .onChange(of: secilenModelChevro) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Citroen:
                        enumPicker("Model", selection: $secilenModelCitroen)
                            .onChange(of: secilenModelCitroen) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Cupra:
                        enumPicker("Model", selection: $secilenModelCupra)
                            .onChange(of: secilenModelCupra) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Dacia:
                        enumPicker("Model", selection: $secilenModelDacia)
                            .onChange(of: secilenModelDacia) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .DS_Automobiles:
                        enumPicker("Model", selection: $secilenModelDS)
                            .onChange(of: secilenModelDS) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Fiat:
                        enumPicker("Model", selection: $secilenModelFiat)
                            .onChange(of: secilenModelFiat) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Ford:
                        enumPicker("Model", selection: $secilenModelFord)
                            .onChange(of: secilenModelFord) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Honda:
                        enumPicker("Model", selection: $secilenModelHonda)
                            .onChange(of: secilenModelHonda) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Hyundai:
                        enumPicker("Model", selection: $secilenModelHyundai)
                            .onChange(of: secilenModelHyundai) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Kia:
                        enumPicker("Model", selection: $secilenModelKia)
                            .onChange(of: secilenModelKia) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .Mazda:
                        enumPicker("Model", selection: $secilenModelMazda)
                            .onChange(of: secilenModelMazda) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Mercedes_Benz):
                        enumPicker("Model", selection: $secilenModelMercedes)
                            .onChange(of: secilenModelMercedes) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Mini):
                        enumPicker("Model", selection: $secilenModelMini)
                            .onChange(of: secilenModelMini) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Mitsubishi):
                        enumPicker("Model", selection: $secilenModelMishubishi)
                            .onChange(of: secilenModelMishubishi) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Nissan):
                        enumPicker("Model", selection: $secilenModelNissan)
                            .onChange(of: secilenModelNissan) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Opel):
                        enumPicker("Model", selection: $secilenModelOpel)
                            .onChange(of: secilenModelOpel) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Peugeot):
                        enumPicker("Model", selection: $secilenModelPeugeot)
                            .onChange(of: secilenModelPeugeot) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Porsche):
                        enumPicker("Model", selection: $secilenModelPorsche)
                            .onChange(of: secilenModelPorsche) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Renault):
                        enumPicker("Model", selection: $secilenModelRenault)
                            .onChange(of: secilenModelRenault) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Seat):
                        enumPicker("Model", selection: $secilenModelSeat)
                            .onChange(of: secilenModelSeat) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Skoda):
                        enumPicker("Model", selection: $secilenModelSkoda)
                            .onChange(of: secilenModelSkoda) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Subaru):
                        enumPicker("Model", selection: $secilenModelSubaru)
                            .onChange(of: secilenModelSubaru) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Suzuki):
                        enumPicker("Model", selection: $secilenModelSuzuki)
                            .onChange(of: secilenModelSuzuki) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Tesla):
                        enumPicker("Model", selection: $secilenModelTesla)
                            .onChange(of: secilenModelTesla) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Tofaş):
                        enumPicker("Model", selection: $secilenModelTofas)
                            .onChange(of: secilenModelTofas) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Toyota):
                        enumPicker("Model", selection: $secilenModelToyota)
                            .onChange(of: secilenModelToyota) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Volkswagen):
                        enumPicker("Model", selection: $secilenModelVolkswagen)
                            .onChange(of: secilenModelVolkswagen) { _, new in
                                secilenModelOtomobil = new
                            }
                    case .some(.Volvo):
                        enumPicker("Model", selection: $secilenModelVolvo)
                            .onChange(of: secilenModelVolvo) { _, new in
                                secilenModelOtomobil = new
                            }
                    case nil:
                        enumPicker("Model", selection: $secilenModelAlfa)
                            .disabled(secilenModelAlfa == nil)

                    }
                    
                   
                 
                    
                    customPicker("Yıl", selection: $secilenYil, options: yillar.map{"\($0)"})
                        .disabled(!isModelSelected(for: secilenMarkaOtomobil))
                        .tint(.white)
                        
                    
                    
                    Spacer()
                    
                    // DEVAM ET BUTONU
                    Button(action: {
                        // Seçimlere göre işlem
                        guard let konum = locationManager.currentLocation else { return }
                        location = konum
                        print("Konum: \(konum.latitude), \(konum.longitude)")
                        sehirBul(latitude: konum.latitude, longitude: konum.longitude) { value in
                            if let value = value {
                                print(value)
                                locationCity = value
                            }
                        }
                        isShowLocationScreen = true
                        switch secilenKategori {
                        case .otomobil:
                            offer = Otomobil(otomarka: secilenMarkaOtomobil!, arac: .otomobil, yil: secilenYil!, otomodel: secilenModelOtomobil!)
                            
                        case .motor:
                            offer = Otomobil(otomarka: secilenMarkaOtomobil!, arac: .otomobil, yil: secilenYil!, otomodel: secilenModelOtomobil!)
                        case .suv:
                            offer = Otomobil(otomarka: secilenMarkaOtomobil!, arac: .otomobil, yil:secilenYil!, otomodel: secilenModelOtomobil!)
                        case nil:
                            print("unsucces")
                        }
                        
                        switch offer {
                        case let oto as Otomobil:
                            print(oto.arac,oto.otomarka,oto.otomodel,oto.yil)
                        case let motor as Otomobil:
                            print("")
                        case let suv as Otomobil:
                            print("")
                        default:
                            print("unsucces")
                        }
                       
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
                        ScreenLocationForCekici()
                    }
                    .disabled( // Buton devre dışı mı?
                        secilenKategori == nil ||
                        secilenMarkaOtomobil == nil ||
                        !isModelSelected(for: secilenMarkaOtomobil) ||
                        secilenYil == nil
                    )
                    .opacity(
                        (secilenKategori == nil || secilenMarkaOtomobil == nil || secilenYil == nil) ? 0.5 : 1.0
                    )
                    .padding(.horizontal)
                    
                    Spacer()

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
}

    
        
        
        // MARK: - Custom Picker
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
    ScreenCekici(offer: Vasita(arac: .otomobil, yil: "2000"))
}
