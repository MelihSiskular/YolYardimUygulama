//
//  ScreenLastik.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import CoreLocation

struct ScreenLastik: View {

    @State private var secilenIslem: String = "Yeni Lastik"
    @State private var secilenInput: String = "Ebata Göre"
    @State private var secilenGenislik: String? = nil
    @State private var secilenOran: String? = nil
    @State private var secilenCap: String? = nil
    @State private var secilenMevsim: String? = nil
    
    @StateObject private var locationManager = LocationManager()
    @State private var location = CLLocationCoordinate2D()
    @State private var locationCity = ""

    
    let islemSecenekleri = ["Yeni Lastik", "Tamir", "Stepne Takım"]
    let inputSecenekleri = ["Ebata Göre","Modele Göre"]
    let genislikler = ["155", "165", "175", "185", "195", "205"]
    let oranlar = ["50", "55", "60", "65", "70"]
    let caplar = ["13", "14", "15", "16", "17"]
    let mevsimler = ["Yaz", "Kış", "4 Mevsim"]
    
    
    @State private var secilenKategori: String? = nil
    @State private var secilenMarka: String? = nil
    @State private var secilenModel: String? = nil
    @State private var secilenYil: String? = nil
    
    let kategoriler = ["Otomobil", "Ticari", "Arazi", "Motosiklet"]
    let markalar = ["BMW", "Mercedes", "Toyota", "Renault", "Ford"]
    let modeller = ["Sedan", "SUV", "Hatchback", "Pickup"]
    let yillar = (1995...2025).map { "\($0)" }
    var body: some View {
            ZStack {
                ScreenBackground()
                
                VStack(spacing: 10) {
                    Text("Lastik Yardım")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding()
                    
                    VStack(alignment: .leading,spacing: 4) {
                        Text("Yapılacak İşlem")
                            .font(.title.bold())
                            .foregroundColor(.white)
                            .padding(.top, 30)
                        RoundedRectangle(cornerRadius: 1)
                            .frame(height: 1)
                            .opacity(0.4)
                    }
                   
                    
               
                    Picker("İşlem", selection: $secilenIslem) {
                        ForEach(islemSecenekleri, id: \.self) { islem in
                            Text(islem)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    .cornerRadius(10)
                    .padding(.bottom)

                    
                    if secilenIslem == "Yeni Lastik" {
                        Picker("İşlem", selection: $secilenInput) {
                            ForEach(inputSecenekleri, id: \.self) { islem in
                                Text(islem)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        .cornerRadius(10)
                        .padding(.bottom)
                        
                        if secilenInput == "Ebata Göre" {
                            customPicker("Genişlik", selection: $secilenGenislik, options: genislikler)
                                .tint(.white)
                            customPicker("Oran", selection: $secilenOran, options: oranlar)
                                .tint(.white)
                                .disabled(secilenGenislik == nil)
                            
                            customPicker("Çap", selection: $secilenCap, options: caplar)
                                .tint(.white)
                                .disabled(secilenOran == nil)
                            
                            
                            customPicker("Mevsim", selection: $secilenMevsim, options: mevsimler)
                                .tint(.white)
                                .disabled(secilenCap == nil)
                        }else if secilenInput == "Modele Göre" {
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
                        }
                        
                     


                    }else {
                        Spacer()
                        Text("Herhangi bir bilgiye ihtiyaç yok...")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.top, 30)
                    }
                    Spacer()
                    // DEVAM ET BUTONU
                    
                    if location.latitude == 0.0 {
                        Text("Canlı Konumunuz alınacaktır...")
                            .fontWeight(.thin)
                            .fontWidth(.condensed)
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding()
                    } else {
                        VStack(spacing: 2) {
                            Text("\(location.latitude)-\(location.longitude)")
                            Text(locationCity)
                        }
                        .fontWeight(.thin)
                        .fontWidth(.condensed)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    }
                   
                    Button(action: {
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
                    .disabled(
                        (secilenIslem == "Yeni Lastik" && secilenInput == "Ebata Göre" &&
                         (secilenGenislik == nil ||
                          secilenOran == nil ||
                          secilenCap == nil ||
                          secilenMevsim == nil))
                        
                        ||
                        
                        (secilenIslem == "Yeni Lastik" && secilenInput == "Modele Göre" &&
                         (secilenKategori == nil ||
                          secilenMarka == nil ||
                          secilenModel == nil ||
                          secilenYil == nil))
                    )
                    .opacity(
                        (secilenIslem == "Yeni Lastik" && secilenInput == "Ebata Göre" &&
                         (secilenGenislik == nil ||
                          secilenOran == nil ||
                          secilenCap == nil ||
                          secilenMevsim == nil))
                        
                        ||
                        
                        (secilenIslem == "Yeni Lastik" && secilenInput == "Modele Göre" &&
                         (secilenKategori == nil ||
                          secilenMarka == nil ||
                          secilenModel == nil ||
                          secilenYil == nil))
                        ? 0.5 : 1.0
                    )
                    .padding(.horizontal)
                    Spacer()
                }
                .padding()
                
            }
        
        
        
     
    }
    func customPicker(_ title: String, selection: Binding<String?>, options: [String]) -> some View {
        let binding = Binding<String>(
            get: { selection.wrappedValue ?? "" },
            set: { selection.wrappedValue = $0.isEmpty ? nil : $0 }
        )
        
        let label = HStack {
            Text(selection.wrappedValue ?? "\(title) Seçiniz")
                .foregroundColor(selection.wrappedValue == nil ? .white.opacity(0.7) : .white)
                .font(.title3)
                .fontWeight(.medium)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.white.opacity(0.7))
                .font(.title3)
        }
            .padding()
            .frame(height: 60)
            .background(Color.white.opacity(0.15))
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
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
}

#Preview {
    ScreenLastik()
}
