import SwiftUI
import MapKit
import CoreLocation

struct PinModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}



struct ScreenLocationForCekici: View {
    @State private var konumAyarlandi = false
    @State private var isShowScreenOnaylandi = false
 
    @Binding var kullanici: User?
    @Binding var kategori: AracTuru?
    @Binding var marka: OtomobilMarka?
    @Binding var model: Any?

    @Binding var secilenModel: String
    @Binding var yil: String?
    @Binding var longitudeAnlık: Double
    @Binding var latitudeAnlık: Double

    @State var longitudeHedef: Double = 0.0
    @State var latitudeHedef: Double = 0.0

    @State var offer : Vasita = Vasita(arac: .otomobil, yil: "0")



    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.0, longitude: 28.9),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State private var selectedPin: PinModel? = nil
    @State private var address = "Haritada bir yere uzun basarak konum seçin"
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                
                VStack(spacing: 16) {
                    Text("Hedef Konum")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding(10)
                        .lineLimit(1)
                    HStack {
                        Text("Gidilecek Konum Bilgisi Basılı Tutarak Seçin...")
                            .font(.headline.italic())
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding()
                    
                    GeometryReader { geometry in
                        Map(coordinateRegion: $region, annotationItems: selectedPin.map { [$0] } ?? []) { pin in
                            MapMarker(coordinate: pin.coordinate, tint: .red)
                        }
                        .cornerRadius(12)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.4)
                                .sequenced(before: DragGesture(minimumDistance: 0))
                                .onEnded { value in
                                    switch value {
                                    case .second(true, let drag):
                                        if let dragLocation = drag?.location {
                                            let size = geometry.size
                                            let point = convertPointToCoordinate(point: dragLocation, in: region, viewSize: size)
                                            selectedPin = PinModel(coordinate: point)
                                            reverseGeocode(coordinate: point)
                                        }
                                    default:
                                        break
                                    }
                                }
                        )
                    }
                    .frame(height: 300)
                    .padding(.horizontal)
                    
                    Text(address)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        isShowScreenOnaylandi.toggle()
                        print("Devam Et tıklandı, konum: \(selectedPin?.coordinate.latitude ?? 0), \(selectedPin?.coordinate.longitude ?? 0)")
                        switch kategori {
                        case .otomobil:
                            offer = Otomobil(otomarka: marka!, arac: kategori!, yil: yil!, otomodel: model!)
                            
                        case .motor:
                            offer = Otomobil(otomarka: marka!, arac: kategori!, yil: yil!, otomodel: model!)
                        case .suv:
                            offer = Otomobil(otomarka: marka!, arac: kategori!, yil: yil!, otomodel: model!)
                        case nil:
                            print("unsucces")
                        }
                        
                        switch offer {
                        case let oto as Otomobil:
                            print(oto.arac,oto.otomarka,oto.otomodel,oto.yil)
                            kaydet(kategori: oto.arac,
                                   marka: oto.otomarka,
                                   model: secilenModel,
                                   yil: oto.yil,
                                   longituteHedef: longitudeHedef,
                                   latitudeHedef: latitudeHedef,
                                   longituteAnlık: longitudeAnlık,
                                   latitudeAnlık: latitudeAnlık) { result in
                                switch result {
                                case .failure(let error):
                                    print(error.localizedDescription)
                                case .success(_):
                                    print("succes")
                                    
                                }
                            }
                        case let motor as Otomobil:
                            print("")
                        case let suv as Otomobil:
                            print("")
                        default:
                            print("unsucces")
                        }
                        
                    }) {
                        Text("Devam Et")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.orange, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .navigationDestination(isPresented: $isShowScreenOnaylandi) {
                        ScreenOnaylandi()
                    }
                    Spacer()
                }
            }
            .onAppear {
                if !konumAyarlandi, let loc = locationManager.currentLocation {
                    region.center = loc
                    selectedPin = PinModel(coordinate: loc)
                    reverseGeocode(coordinate: loc)
                    konumAyarlandi = true
                }
            }
            .onChange(of: locationManager.currentLocation) { loc in
                if let loc = loc, !konumAyarlandi {
                    region.center = loc
                    selectedPin = PinModel(coordinate: loc)
                    reverseGeocode(coordinate: loc)
                    konumAyarlandi = true 
                }
            }
        }
    }
    
    func convertPointToCoordinate(point: CGPoint, in region: MKCoordinateRegion, viewSize: CGSize) -> CLLocationCoordinate2D {
        let xPercent = point.x / viewSize.width
        let yPercent = point.y / viewSize.height
        
        let latitudeDelta = region.span.latitudeDelta
        let longitudeDelta = region.span.longitudeDelta
        
        let latitude = region.center.latitude + (0.5 - yPercent) * latitudeDelta
        let longitude = region.center.longitude + (xPercent - 0.5) * longitudeDelta
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    func reverseGeocode(coordinate: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let place = placemarks?.first {
                let city = place.locality ?? ""
                let street = place.thoroughfare ?? ""
                let country = place.country ?? ""
                address = "\(street), \(city), \(country)"
            } else {
                address = "Adres bulunamadı"
            }
        }
    }
    func kaydet(
        kategori: AracTuru,
        marka: OtomobilMarka,
        model: String,
        yil: String,
        longituteHedef: Double,
        latitudeHedef: Double,
        longituteAnlık: Double,
        latitudeAnlık: Double,
        completion: @escaping (Result<VasitaParseCekici, Error>) -> Void
    ) {
        var arac = VasitaParseCekici()
        arac.Kategori = kategori.rawValue
        arac.marka = marka.rawValue
        arac.model = model
        arac.yil = yil
        arac.longituteHedef = Double(selectedPin?.coordinate.longitude ?? 0.0)
        arac.latitudeHedef = Double(selectedPin?.coordinate.latitude ?? 0.0)
        arac.longituteAnlik = longituteAnlık
        arac.latitudeAnlik = latitudeAnlık
        arac.kullanici = User.current
        
        arac.save { result in
            switch result {
            case .success(let savedCar):
                print("Başarıyla kayıt edildi: \(savedCar)")
                completion(.success(savedCar))
            case .failure(let error):
                print("Kayıt hatası: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}


//#Preview {
//    ScreenLocationForCekici(kullanici: .constant(User(), kategori: <#Binding<AracTuru>#>, marka: <#Binding<OtomobilMarka>#>, model: <#Binding<String>#>, yil: <#Binding<String>#>, longitude: <#Binding<Double>#>, latitude: <#Binding<Double>#>)
//}
