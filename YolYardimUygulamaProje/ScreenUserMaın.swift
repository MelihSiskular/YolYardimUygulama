//
//  ScreenUserMaın.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ScreenUserMain: View {
    
    @Binding  var isShowLastikView : Bool
    @Binding  var isShowCekicikView : Bool
    


    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                
                VStack(spacing: 20) {
                    
                    Text("Kullanıcı Paneli")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 2, y: 2)
                        .padding(.top,60)
                    
                    
                    Spacer()
                    // LASTİK
                    Button(action: {
                        isShowLastikView = true
                    }) {
                        Text("🛞 Lastik")
                            .bigServiceButton(colors: [Color.blue, Color.cyan])
                    }
                   
                    
                    // ÇEKİCİ
                    Button(action: {
                        isShowCekicikView = true
                    }) {
                        Text("🚛 Çekici")
                            .bigServiceButton(colors: [Color.orange, Color.red])
                    }
                    // 112 ACİL
                    Button(action: {
                        if let url = URL(string: "tel://112") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("🚨 112 Acil")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(Color.red)
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.4), radius: 8, x: 4, y: 4)
                    }
                    
                    Spacer()
           
                        
                    }
                .padding()
                 
                }
   
            }.tint(.white)
        }
    }

extension View {
    func bigServiceButton(colors: [Color]) -> some View {
        self
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 120)
            .background(
                LinearGradient(colors: colors,
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
    }
}

#Preview {
    ScreenUserMain(isShowLastikView: .constant(false), isShowCekicikView: .constant(false))
}
