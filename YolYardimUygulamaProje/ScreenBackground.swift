//
//  ScreenBackground.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ScreenBackground: View {
    var body: some View {
        
        //ARKA PLAN
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.1, blue: 0.2),
                Color(red: 1.0, green: 0.6, blue: 0.0)
            ]),
            startPoint: .bottom,
            endPoint: .top
        )
        .ignoresSafeArea()
 
    }
}

#Preview {
    ScreenBackground()
}
