//
//  ScreenPanelForAdmins.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import ParseSwift

struct ScreenPanelForAdmins: View {
    @State private var cekiciListesi : [VasitaParseCekici] = []
    init() {
        
        UITabBar.appearance().barTintColor = UIColor.black
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    @State var selectedScreen = 0
    @State private var badgeCekiciList = 0
    
    var body: some View {
        ZStack {
            ScreenBackground()
            
            VStack {
                TabView(selection: $selectedScreen) {
                    
                    ScreenMainForAdmins(badgeListCekici: $badgeCekiciList)
                        .tabItem {
                            Label("Ana Ekran", systemImage: "house")
                        }.tag(0)
                        .badge(badgeCekiciList)
                    ScreenUserSettings()
                        .tabItem {
                            Label("Ayarlar", systemImage: "gear")
                        }.tag(1)
                    
                }
                .tint(.orange)
            }
        }
        .onAppear {
            fetchCekiciVerileri()
        }.onDisappear {
            fetchCekiciVerileri()
        }
    }
    func fetchCekiciVerileri() {
        let query = VasitaParseCekici.query()
        query.find { result in
            switch result {
            case .success(let veriler):
                self.cekiciListesi = veriler
                badgeCekiciList = cekiciListesi.count

            case .failure(let error):
                print("Veri çekme hatası: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ScreenPanelForAdmins()
}
