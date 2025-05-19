//
//  ScreenOnaylandi.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 29.04.2025.
//

import SwiftUI

struct ScreenOnaylandi: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isAnimating = true
    
    @State private var rotation = 0.0
    @State private var showButton = false
    @State private var isShowMainScreen = false
    
    var body: some View {
        ZStack {
            ScreenBackground()
            
            VStack {
                Spacer()
                
                
                Image(systemName: "hourglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(rotation))
                    .onAppear {
                        startRotating()
                    }
                
                
                
                Text(showButton ? "İşlem Onaylandı.":"İşleminiz Alınıyor...")
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                
                if showButton {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Ana Sayfaya Dön")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
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
                            .padding(.horizontal)
                            .shadow(radius: 4)
                    }
                    .transition(.opacity)
                  
                }
                
                Spacer()
            
           
            }
      
            .padding()
        }
    }
    func startRotating() {
        withAnimation(.linear(duration: 3)) {
            rotation = 360
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                showButton = true
            }
           
            isAnimating = false
        }
    }
}

#Preview {
    ScreenOnaylandi()
}
