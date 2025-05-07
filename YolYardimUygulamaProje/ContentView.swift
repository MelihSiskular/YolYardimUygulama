//
//  ContentView.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedTab = 0
    @State private var isShowRegisterScreen = false
    
    @State private var isShowUserPanel = false
    @State private var isShowAdminPanel = false

    @State private var showAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                ScreenBackground()
                
                VStack {
                    
                    //Main Title
                    Text("Trakya Yol Yardım")
                        .font(.system(size: 40)).bold().fontDesign(.default)
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 4, x: 1, y: 1)
                        .padding(.top,40)
                    
                    Spacer()
                    
                    
                    TabView(selection: $selectedTab) {
                        
                        VStack {
                            // Başlık
                            Text("Kullanıcı Girişi")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                            Text("Lütfen hesabınıza giriş yapın")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                            
                            // E-posta TextField
                            TextField("E-posta", text: $email)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
                            // Parola SecureField
                            SecureField("Parola", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                            // GİRİŞ YAP Butonu
                            Button(action: {
                                
                                loginUser(email: email, password: password) { result in
                                    switch result {
                                    case .success:
                                        isShowUserPanel.toggle()
                                        // Giriş başarılı → ekran geçişi, alert vs.
                                        print("Giriş başarılı")
                                    case .failure(let error):
                                        // Alert göster veya hata mesajı
                                        showAlert.toggle()
                                        print("Giriş başarısız: \(error.localizedDescription)")
                                    }
                                }
                                
                            }) {
                                Text("GİRİŞ YAP")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
                                
                            }
                            
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("❌ İşlem Reddedildi")
                                    .fontWeight(.bold),
                                message: Text("Geçersiz Kullanıcı Adı Veya Parola"),
                                dismissButton: .default(Text("Tamam").foregroundColor(.orange))
                            )
                        }
                        .padding()
                        .tag(0)
                        
                        VStack() {
                            Text("Yönetici Girişi")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                            Text("Lütfen hesabınıza giriş yapın")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.7))
                            
                            TextField("Admin E-posta", text: .constant(""))
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            SecureField("Parola", text: .constant(""))
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                            Button("GİRİŞ YAP") {
                                isShowAdminPanel.toggle()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                        }
                        .padding()
                        .tag(1)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height:350)
                    
                    Spacer()
                    Button(action: {
                        isShowRegisterScreen.toggle()
                        // Kayıt sayfasına geçiş
                    }) {
                        
                        Text("👤Yeni Hesap Oluştur")
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
                        
                    }
                    
                    Spacer()
                }
                
            }
            .navigationDestination(isPresented: $isShowRegisterScreen) {
                ScreenRegister()
            }
            .navigationDestination(isPresented: $isShowUserPanel) {
                ScreenPanelForUsers()
                
            }
            .navigationDestination(isPresented: $isShowAdminPanel) {
                ScreenPanelForAdmins()
            }
            .hideKeyboardOnTap()

           
        }
        .tint(.white)
    }
        
    func loginUser(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        User.login(username: email, password: password) { result in
            switch result {
            case .success(let user):
                if user.isAdmin == false {
                    // Bu kullanıcı admin, kullanıcı paneline alınmasın
                    completion(.success(()))
                } else {
                    // Normal kullanıcı
                    completion(.failure("error" as! Error))
                }
              
            case .failure(let error):
                print("❌ Giriş hatası: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}




#Preview {
    ContentView()
}
