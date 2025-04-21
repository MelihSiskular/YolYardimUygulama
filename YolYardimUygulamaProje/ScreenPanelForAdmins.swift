//
//  ScreenPanelForAdmins.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

struct ScreenPanelForAdmins: View {
    init() {
        
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    @State var selectedScreen = 0
    
    var body: some View {
        ZStack {
            ScreenBackground()
            
            VStack {
                TabView(selection: $selectedScreen) {
                    
                    ScreenUserProposals()
                        .tabItem {
                            Label("Ana Ekran", systemImage: "house")
                        }.tag(0)
                        .badge(2)
                    ScreenUserProposals()
                        .tabItem {
                            Label("Ayarlar", systemImage: "gear")
                        }.tag(1)
                    
                }
                .tint(.orange)
            }
        }
    }
}

#Preview {
    ScreenPanelForAdmins()
}
