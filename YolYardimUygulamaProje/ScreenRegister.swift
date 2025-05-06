//
//  ScreenRegister.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ScreenRegister: View {
    @State private var email = ""
    @State private var adSoyad = ""
    @State private var sifre = ""
    @State private var numara = ""
    @State private var isAdmin = false

    
    @State private var secilenRol = "Kullanıcı"
    let roller = ["Kullanıcı", "Yönetici"]
    
    var body: some View {
        ZStack {
            
            ScreenBackground()
            
            VStack(spacing: 20) {
                // Başlık
                Text("Hesap Oluştur")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                    .padding(.bottom, 10)
                
                
                
                // Roller Arası Seçim
                VStack(alignment: .center, spacing: 0) {
                    
                    Text("Hesap Türü")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.subheadline)
                    Picker("Rol Seç", selection: $secilenRol) {
                        ForEach(roller, id: \.self) { rol in
                            Text(rol)
                                .foregroundColor(.white) 
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of:secilenRol) { _, _ in
                        isAdmin.toggle()
                    }
                }
           
                
                // E-Posta
                TextField("E-posta", text: $email)
                    .textFieldStyleCustom()
                
                // Ad Soyad
                TextField(isAdmin ? "Dükkan İsmi" : "Ad Soyad", text: $adSoyad)
                    .textFieldStyleCustom()
                
                // Şifre
                SecureField("Şifre", text: $sifre)
                    .textFieldStyleCustom()
                
                // Numara
                TextField("Telefon Numarası", text: $numara)
                    .keyboardType(.numberPad)
                    .textFieldStyleCustom()
                
                // Kayıt Ol Butonu
                Button(action: {
                    print("Kayıt Ol tıklandı")
                }) {
                    Text("Kayıt Ol")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                }
                .padding(.top, 10)
            }
            .padding()
        }
    }
}
extension View {
    func textFieldStyleCustom() -> some View {
        self
            .padding()
            .background(Color.white.opacity(0.15))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}


#Preview {
    ScreenRegister()
}
