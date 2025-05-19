//
//  ScreenInfoSheet.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 19.05.2025.
//

import SwiftUI

struct ScreenInfoSheet: View {
    var body: some View {
        ZStack {
            ScreenBackground()
            
            VStack {
                Text("Lastik Ebat Öğrenme")
                    .font(.system(size: 34)).bold().fontDesign(.default)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.5), radius: 4, x: 1, y: 1)
                    .padding(.top,20)
                
                Image("lastik")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    
                    
                Text("Lastiğimiz üstünde bu şekilde sayılar bulunacaktır. Bunlar ebatımızı öğrenmek için yeterlidir")
                    .font(.title3)
                    .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                    .padding()
                VStack(alignment:.leading) {
                    Text("Taban Genişliği: \"Genişlik\" seçiniz dediğimiz yer için. 145-355 Arası Değerler.")
                       
                    Text("Yanak Yüksekliği: \"Oran\" seçiniz dediğimiz yer için. 25-80 Arası Değerler.")
                    
                    Text("Jant Çapı: \"Çap\" seçiniz dediğimiz yer için. 13-24 Arası Değerler.")
                    
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ScreenInfoSheet()
}
