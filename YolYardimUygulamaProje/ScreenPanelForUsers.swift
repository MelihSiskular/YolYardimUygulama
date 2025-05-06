//
//  ScreenPanelForUsers.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI

import SwiftUI

struct ScreenPanelForUsers: View {
    @State private var isShowLastik = false
    @State private var isShowCekici = false
    @State var selectedScreen = 1
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScreenBackground()
                
                VStack {
                    TabView(selection: $selectedScreen) {
                        ScreenUserProposals()
                            .tabItem {
                                Label("Teklifler", systemImage: "message")
                            }.tag(0)
                            .badge(2)
                        
                        // Ana ekran (lastik/çekici yönlendirme butonları burada)
                        ScreenUserMain(isShowLastikView: $isShowLastik, isShowCekicikView: $isShowCekici)
                            .tabItem {
                                Label("Ana Ekran", systemImage: "house")
                            }.tag(1)
                        
                        ScreenUserSettings()
                            .tabItem {
                                Label("Ayarlar", systemImage: "gear")
                            }.tag(2)
                    }
                    .tint(.orange)
                }
            }
            .navigationDestination(isPresented: $isShowLastik) {
                ScreenLastik()
            }
            .navigationDestination(isPresented: $isShowCekici) {
                ScreenCekici(offer: Vasita(arac: .otomobil, yil: "2000"))
            }
        }
    }
}


#Preview {
    ScreenPanelForUsers()
}
