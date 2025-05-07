//
//  ScreenUserSettings.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ScreenUserSettings: View {
    var body: some View {
        ZStack {
            ScreenBackground()
            VStack {
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.orange.mix(with: .white, by: 0.4))
                        .frame(height: 150)
                        .shadow(color: .black, radius: 2)
                        .padding()
                    
                    VStack() {
                        HStack {
                            
                        }
                        Text("Kullanıcı Adı: ")
                        Text("Telefon Numara: ")
                        
                        
                    }
                 
                    
                   
                
                }
                
                Spacer()
                
                Button(action: {
                    // Kayıt sayfasına geçiş
                }) {
                    
                    Text("Çıkış Yap")
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
                    
                }.padding(.vertical)
            }
        }
    }
}

#Preview {
    ScreenUserSettings()
}
