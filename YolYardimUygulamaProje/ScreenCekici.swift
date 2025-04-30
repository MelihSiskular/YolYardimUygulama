//
//  ScreenCekici.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import CoreLocation

struct ScreenCekici: View {
    @State private var secilenKategori: String? = nil
    @State private var secilenMarka: String? = nil
    @State private var secilenModel: String? = nil
    @State private var secilenYil: String? = nil
    
    @State private var isShowLocationScreen = false

    
    @StateObject private var locationManager = LocationManager()
    @State private var location = CLLocationCoordinate2D()
    @State private var locationCity = ""
    
    
    let kategoriler = ["Otomobil","Arazi", "Motosiklet"]
    let markalar = ["BMW", "Mercedes", "Toyota", "Renault", "Ford"]
    let modeller = ["Sedan", "SUV", "Hatchback", "Pickup"]
    let yillar = (1995...2025).map { "\($0)" }
    
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
                   
                    
                    customPicker("Kategori", selection: $secilenKategori, options: kategoriler)
                        .opacity(secilenKategori == nil ? 0.9 : 1.0)
                        .tint(.white)
                       
                    
                    customPicker("Marka", selection: $secilenMarka, options: markalar)
                        .disabled(secilenKategori == nil)
                        .tint(.white)
                    
                    
                    customPicker("Model", selection: $secilenModel, options: modeller)
                        .disabled(secilenMarka == nil)
                        .tint(.white)
                    
                    
                    customPicker("Yıl", selection: $secilenYil, options: yillar)
                        .disabled(secilenModel == nil)
                        .tint(.white)
                    
                    
                    Spacer()
                    
                    // DEVAM ET BUTONU
                    Button(action: {
                        // Seçimlere göre işlem
                        print("Seçilenler: \(secilenKategori ?? "") - \(secilenMarka ?? "") - \(secilenModel ?? "") - \(secilenYil ?? "")")
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
                        secilenMarka == nil ||
                        secilenModel == nil ||
                        secilenYil == nil
                    )
                    .opacity(
                        (secilenKategori == nil || secilenMarka == nil || secilenModel == nil || secilenYil == nil) ? 0.5 : 1.0
                    )
                    .padding(.horizontal)
                    
                    Spacer()

                }
                .padding()
            }
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


#Preview {
    ScreenCekici()
}
