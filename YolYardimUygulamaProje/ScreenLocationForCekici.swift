import SwiftUI
import MapKit
import CoreLocation

struct PinModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}



struct ScreenLocationForCekici: View {
    @State private var konumAyarlandi = false

    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.0, longitude: 28.9),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State private var selectedPin: PinModel? = nil
    @State private var address = "Haritada bir yere uzun basarak konum seçin"
    
    var body: some View {
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
                    print("Devam Et tıklandı, konum: \(selectedPin?.coordinate.latitude ?? 0), \(selectedPin?.coordinate.longitude ?? 0)")
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
}
extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}


#Preview {
    ScreenLocationForCekici()
}
