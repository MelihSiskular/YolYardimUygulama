//
//  ScreenMainForAdmins.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 8.05.2025.
//

import SwiftUI
import ParseSwift
import MapKit


struct ScreenMainForAdmins: View {
    @State private var result = ""
    @State private var cekiciListesi: [VasitaParseCekici] = []
    
    @State private var mesafeler: [String: String] = [:]
    @State private var isimler: [String: String] = [:]

    
    var body: some View {
        ScrollView {
            
            
            VStack(spacing: 15) {
                VStack {
                    Text("Admin Paneli")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                    HStack {
                        Text("Gelen Teklifler")
                            .font(.title.italic())
                            .foregroundColor(.white)
                            .padding()
                          
                        Spacer()
                    }
                }
          
              
                ForEach(cekiciListesi, id: \.objectId) { item in
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            
                            if item.Kategori == "otomobil" {
                                Label(item.Kategori?.capitalized ?? "Kategori", systemImage: "car")
                                    .font(.title2.bold())
                            }else if item.Kategori == "motor" {
                                Label(item.Kategori?.capitalized ?? "Kategori", systemImage: "bicycle")
                                    .font(.title2.bold())
                            }else if item.Kategori == "suv" {
                                Label(item.Kategori?.capitalized ?? "Kategori", systemImage: "truck.box")
                                    .font(.title2.bold())
                            }
                      
                            Spacer()
                            Text(item.yil ?? "")
                                .font(.subheadline)
                                .foregroundColor(.gray.mix(with: .white, by: 0.8))
                        }
                        
                        Divider().background(Color.white.opacity(0.2))
                        
                    
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Label(" Müşteri: \(item.fullName ?? "-")", systemImage: "person.fill")
                            Label("Marka: \(item.marka ?? "-")", systemImage: "wrench.and.screwdriver")
                            Label("Model: \(item.model ?? "-")", systemImage: "gear")
                            Text(Image(systemName: "location.fill")) + Text("  \(mesafeler[item.objectId ?? ""] ?? "")")
                           
                               
                            
                            
                        }
                       
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .onAppear {
                      
                            if mesafeler[item.objectId ?? ""] == nil {
                                getDistance(item: item) { sonuc in
                                    mesafeler[item.objectId ?? ""] = sonuc
                            
                                }
                                
                            }
                        
                        }
                      
                        
                        Button(action: {
                            if let admin = User.current {
                                onayla(cekici: item, admin: admin) { result in
                                    switch result {
                                    case .success:
                                        fetchCekiciVerileri()
                                        print("Onaylama başarılı")
                                    case .failure(let error):
                                        print("Onaylama hatası: \(error.localizedDescription)")
                                    }
                                }
                            } else {
                                print("Giriş yapan admin bulunamadı.")
                            }
                        }) {
                            Label("Onayla", systemImage: "checkmark.seal.fill")
                                .font(.subheadline.bold())
                                .padding(.vertical, 6)
                                .frame(maxWidth: .infinity)
                                .background(Color.green.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.25), radius: 6, x: 2, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                
                }
                
                Spacer()
            }
            
            .padding()
        }
        .background(    LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.1, blue: 0.2),
                Color(red: 1.0, green: 0.6, blue: 0.0)
            ]),
            startPoint: .bottom,
            endPoint: .top
        ).ignoresSafeArea())
        .onAppear(perform: fetchCekiciVerileri)
        
        
        
    
    }
    func onayla(cekici: VasitaParseCekici, admin: User, completion: @escaping (Result<Void, Error>) -> Void) {
        var onayli = OnayliVasita()
        
        onayli.emailKullanici = cekici.emailKullanici
        onayli.kullanici = cekici.kullanici
        onayli.onaylayanAdmin = admin
        onayli.nameAdmin = admin.fullName
        onayli.phoneAdmin = admin.phone
        onayli.longituteAdmin = admin.longituteAdmin
        onayli.latitudeAdmin = admin.latitudeAdmin
        onayli.longituteAnlik = cekici.longituteAnlik
        onayli.latitudeAnlik = cekici.latitudeAnlik
        onayli.longituteHedef = cekici.longituteHedef
        onayli.latitudeHedef = cekici.latitudeHedef
        
        onayli.save { result in
            switch result {
            case .success:
                print("✅ Onaylı vasıta başarıyla kaydedildi.")
                completion(.success(()))
                cekici.delete { result in
                    switch result {
                    case .success:
                        print("Eski veri silindi")
                    case .failure(let error):
                        print("Silme hatası: \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                print("❌ Onaylama hatası: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }

    
    func fetchCekiciVerileri() {
        let query = VasitaParseCekici.query().include("kullanici")
        query.find { result in
            switch result {
            case .success(let veriler):
                self.cekiciListesi = veriler

            case .failure(let error):
                print("Veri çekme hatası: \(error.localizedDescription)")
            }
        }
    }
    
    
    func getDistance(item: VasitaParseCekici, completion: @escaping (String) -> Void) {
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: item.latitudeAnlik ?? 0.0, longitude: item.longituteAnlik ?? 0.0)))
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  User.current?.latitudeAdmin ?? 0.0, longitude:  User.current?.longituteAdmin ?? 0.0)))
        
        let request = MKDirections.Request()
        request.source = source
        request.destination = destination
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                let distanceText = "\(String(format: "%.1f", route.distance / 1000)) km Uzaklıkta."
                completion(distanceText)
            } else {
                completion(" - km Uzaklıkta.")
            }
        }
    }

//    func getDistance(item: VasitaParseCekici) -> String {
//        var sonuc = " - km Uzaklıkta."
//        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: item.latitudeAnlik ?? 0.0, longitude: item.longituteAnlik ?? 0.0)))
//        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: user?.latitudeAdmin ?? 0.0, longitude: user?.longituteAdmin ?? 0.0)))
//        
//        let request = MKDirections.Request()
//        request.source = source
//        request.destination = destination
//        request.transportType = .automobile // veya .walking
//        
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            if let route = response?.routes.first {
//                sonuc =  "\(route.distance / 1000) km Uzaklıkta."
//                
//                
//            }
//            print(sonuc)
//        }
//        return sonuc
//    }
}

#Preview {
    ScreenMainForAdmins()
}

