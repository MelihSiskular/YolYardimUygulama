//
//  ScreenUserSettings.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import _MapKit_SwiftUI

struct ScreenUserSettings: View {
    @State private var konumAyarlandi = false
    @Environment(\.dismiss) private var dismiss

    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.0, longitude: 28.9),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    @State private var selectedPin: PinModel? = nil
    @State private var address = "Haritada bir yere uzun basarak konum seçin"
    var user = User.current
    var body: some View {
        ZStack {
            ScreenBackground()
            VStack {
                Text("Ayarlar")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding(.top,10)
                    .lineLimit(1)
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.orange.mix(with: .white, by: 0.4))
                        .frame(height: 100)
                        .shadow(color: .black, radius: 2)
                        .padding(.horizontal)
                    
                    VStack() {
                        HStack {
                            
                        }
                        Text(user?.isAdmin == true ? "Dükkan Adı: \((user?.fullName!)! as String)":"Kullanıcı Adı: \((user?.fullName!)! as String)")
                        Text("Telefon Numara: \((user?.phone!)! as String )")
              
                    }
             
                }
                if user?.isAdmin == true {
                    Text(user?.latitudeAdmin != 0.0 ? "\((user?.fullName!)! as String) Konum Bilgisi":"Dükkan Konum Bilgisini Basılı Tutarak Seçin...")
                        .font(.subheadline.italic())
                        .foregroundColor(.white)
                        .lineLimit(1)

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
                    .frame(height: 280)
                    .padding(.horizontal)
                    
                    Button(action: {
                        guncelleUser(user: user!, long: (selectedPin?.coordinate.longitude ?? 0.0), lat: (selectedPin?.coordinate.latitude ?? 0.0)) { result in
                            switch result {
                            case .success(let success):
                                print("succes")
                                
                            case .failure(let failure):
                                print("unsucces")
                            }
                        }
                    }){
                        Text("Kaydet")
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
                }
      
                Spacer()
                Button("",systemImage: "power") {
                    User.logout { result in
                        switch result {
                        case .success:
                            print("Çıkış başarılı.")
                            dismiss()
                        case .failure(let error):
                            print("Çıkış hatası: \(error.localizedDescription)")
                        }
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 40)
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.7), lineWidth: 1.5)
                )
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 2)
                .padding(.vertical)
                
                
           
            }
            .onAppear {
                if !konumAyarlandi {
                    if let userLat = user?.latitudeAdmin, let userLong = user?.longituteAdmin,
                       userLat != 0.0, userLong != 0.0 {
                        
                        let userCoordinate = CLLocationCoordinate2D(latitude: userLat, longitude: userLong)
                        region.center = userCoordinate
                        selectedPin = PinModel(coordinate: userCoordinate)
                        reverseGeocode(coordinate: userCoordinate)
                        konumAyarlandi = true
                        
                    } else if let loc = locationManager.currentLocation {
                        region.center = loc
                        selectedPin = PinModel(coordinate: loc)
                        reverseGeocode(coordinate: loc)
                        konumAyarlandi = true
                    }
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
    func guncelleUser(user: User, long: Double,lat:Double, completion: @escaping (Result<Void, Error>) -> Void) {
        User(objectId: user.objectId).fetch { result in
            switch result {
            case .success(var user):
                user.latitudeAdmin = lat
                user.longituteAdmin = long
                user.save { saveResult in
                    switch saveResult {
                    case .success:
                        print("Güncelleme başarılı.")
                        completion(.success(()))
                    case .failure(let error):
                        print("Güncelleme hatası: \(error)")
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                print("Fetch hatası: \(error)")
                completion(.failure(error))
            }
        }
    }
}


#Preview {
    ScreenUserSettings()
}
