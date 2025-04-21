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

    
    var body: some View {
        NavigationStack {
            ZStack{
                
                ScreenBackground()
                
                VStack {
                    
                    //Main Title
                    Text("Trakya Yol Yardım")
                        .font(.custom("Orbitron-Bold", size: 38))
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.5), radius: 6, x: 2, y: 2)
                        .padding(.top,30)
                    
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
                                isShowUserPanel.toggle()
                                
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
                            
                            Button("ADMİN GİRİŞİ") {
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
           
        }
        .tint(.white)
    }
}
    


#Preview {
    ContentView()
}
