//
//  ContentView.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import ParseSwift

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
                                        email = ""
                                        password = ""
                                    
                                        print("Giriş başarılı")
                                    case .failure(let error):
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
                            
                            TextField("E-posta", text: $email)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
                            SecureField("Parola", text: $password)
                                .padding()
                                .background(Color.white.opacity(0.1))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            
                        
                            
                    
                            
                            Button("GİRİŞ YAP") {
                                
                                loginAdmin(email: email, password: password) { result in
                                    switch result {
                                    case .success:
                                        isShowAdminPanel.toggle()
                                        email = ""
                                        password = ""
                                        
                                        print("Giriş başarılı")
                                    case .failure(let error):
                                        showAlert.toggle()
                                        print("Giriş başarısız: \(error.localizedDescription)")
                                    }
                                }
                               
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                        }
                        .onChange(of: selectedTab, { _, _ in
                            email = ""
                            password = ""
                        })
                        .padding()
                        .tag(1)
                        
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height:350)
                    
                    Spacer()
                    Button(action: {
                        isShowRegisterScreen.toggle()
                        // Kayıt sayfasına geçiş !!!
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
                .onAppear {
                    email = ""
                    password = ""
                }
//                .onAppear {
//                    if User.current != nil {
//                        if User.current?.isAdmin == true {
//                            isShowAdminPanel.toggle()
//                        }else {
//                            isShowUserPanel.toggle()
//                        }
//                    }
//                }
              
                
            }
            .navigationDestination(isPresented: $isShowRegisterScreen) {
                ScreenRegister()
            }
            .navigationDestination(isPresented: $isShowUserPanel) {
                ScreenPanelForUsers()
                
            }
            .navigationDestination(isPresented: $isShowAdminPanel) {
                ScreenPanelForAdmins()
                    .navigationBarBackButtonHidden()
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
                    // Bu user kullanıcı paneline alınmasın
                    completion(.success(()))
                } else {
                    showAlert.toggle()
                }
              
            case .failure(let error):
                print("❌ Giriş hatası: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    func loginAdmin(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        User.login(username: email, password: password) { result in
            switch result {
            case .success(let user):
                if user.isAdmin == true {
                    completion(.success(()))
                } else {
                    showAlert.toggle()
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
