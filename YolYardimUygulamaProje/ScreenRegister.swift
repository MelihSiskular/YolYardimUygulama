//
//  ScreenRegister.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import ParseSwift


struct ScreenRegister: View {
    @State private var email = ""
    @State private var adSoyad = ""
    @State private var sifre = ""
    @State private var numara = ""
    @State private var isAdmin = false

    @State private var showAlert = false
    @State private var isSuccess = false // true: onaylandı, false: onaylanmadı

    @State private var secilenRolAdmin = "Çekici"
    @State private var secilenRol = "Kullanıcı"
    let roller = ["Kullanıcı", "Yönetici"]
    let rollerAdmin = ["Çekici","Lastik"]
    
    var body: some View {
        ZStack {
            
            ScreenBackground()
            
            VStack(spacing: 16) {
                // Başlık
                Text("Hesap Oluştur")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                    .padding(.bottom, 6)
                
                
                
                // Roller Arası Seçim
                VStack(alignment: .center, spacing: 8) {
                    
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
                    .onChange(of:secilenRol) { _, _ in
                        withAnimation {
                            if isAdmin {
                                isAdmin = false
                            }else{
                                isAdmin = true
                            }
                            
                        }
                       
                       
                    }
                    Picker("Rol Seç", selection: $secilenRolAdmin) {
                        ForEach(rollerAdmin, id: \.self) { rol in
                            Text(rol)
                                .foregroundColor(.white)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .offset(x: isAdmin ? 0 : -600)
                    .onChange(of:secilenRolAdmin) { _, _ in
                       
                    }

                } .padding()
                
           
                
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
                    if let currentUser = User.current {
                        User.logout { result in
                            switch result {
                            case .success:
                                print("Başarıyla çıkış yapıldı.")
                                registerUser(email: email, password: sifre, fullName: adSoyad, phone: numara, isAdmin: isAdmin,detay: secilenRolAdmin) { result in
                                    switch result {
                                    case .success:
                                        isSuccess = true
                                        email = ""
                                        sifre = ""
                                        adSoyad = ""
                                        numara = ""
                                        secilenRolAdmin = "Çekici"
                                        secilenRol = "Kullanıcı"
                                        showAlert.toggle()
                                        print("XXXXXXXXXX")
                                        break
                                    case.failure:
                                        isSuccess = false
                                        print("HATA")
                                        print("XXXXXXXXXX")

                                        showAlert.toggle()
                                    }
                                   
                                    
                                }
                            case .failure(let error):
                                print("Çıkış hatası: \(error.localizedDescription)")
                            }
                        }
                        
                    } else {
                        registerUser(email: email, password: sifre, fullName: adSoyad, phone: numara, isAdmin: isAdmin,detay: secilenRolAdmin) { result in
                            switch result {
                            case .success:
                                isSuccess = true
                                email = ""
                                sifre = ""
                                adSoyad = ""
                                numara = ""
                                print("XXXXXXXXXX")
                                secilenRol = "Kullanıcı"
                                secilenRolAdmin = "Çekici"
                                showAlert.toggle()
                                break
                            case.failure:
                                isSuccess = false
                                print("XXXXXXXXXX")
                                print("HATA")
                                showAlert.toggle()
                            }
                            
                        }
                        

                    }
                   
                   

                
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
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(isSuccess ? "✅ İşlem Onaylandı" : "❌ İşlem Reddedildi")
                            .fontWeight(.bold),
                        message: Text(isSuccess ? "Talebiniz başarıyla onaylandı." : "Üzgünüz, işlem gerçekleştirilemedi."),
                        dismissButton: .default(Text("Tamam").foregroundColor(.orange))
                    )
                }
                .padding(.top, 10)
            }
            .padding()
        }
        .hideKeyboardOnTap()
    }
    
    
    func registerUser(email: String, password: String, fullName: String, phone: String, isAdmin: Bool,detay:String, completion: @escaping (Result<Void, Error>) -> Void) {
        var user = User()
        user.username = email
        user.password = password
        user.email = email
        
        // Ekstra alanlar
        if isAdmin {
            user.detail = detay
        }else {
            user.detail = ""
        }
        user.latitudeAdmin = 0.0
        user.longituteAdmin = 0.0
        user.fullName = fullName
        user.phone = phone
        user.isAdmin = isAdmin
        
        user.signup { result in
            switch result {
            case .success:
                print("Kayıt başarılı.")
                completion(.success(()))
         
                
            case .failure(let error):
                print("Kayıt hatası: \(error)")
                completion(.failure(error))
            }
        }
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil, from: nil, for: nil)
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
