//
//  ScreenPanelForUsers.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import Combine
import SwiftUI

struct ScreenPanelForUsers: View {
    @State private var isShowLastik = false
    @State private var isShowCekici = false
    @State var selectedScreen = 1
    @State var badgeList = 0
    @StateObject var viewModel = OnayliVasitaViewModel()
    @StateObject var viewModelLastik = OnayliLastikViewModel()
 
    
    @State private var cancellable: AnyCancellable?


    
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
                        ScreenUserProposals(badgeList: $badgeList)
                            .tabItem {
                                Label("Teklifler", systemImage: "message")
                            }.tag(0)
                            .badge(badgeList)
                        
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
                .onAppear {
                    if let currentEmail = User.current?.email {
                        viewModel.fetch(for: currentEmail)
                        viewModelLastik.fetch(for: currentEmail)
                    }
                    cancellable = Publishers.CombineLatest(viewModel.$liste, viewModelLastik.$liste)
                        .sink { liste1, liste2 in
                            badgeList = liste1.count + liste2.count
                        }
                    
                }
              
//                .onReceive(viewModel.$liste) { yeniListe in
//                    badgeList = yeniListe.count + viewModelLastik.liste.count
//                }
             
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $isShowLastik) {
                ScreenLastik()
            }
            .navigationDestination(isPresented: $isShowCekici) {
                ScreenCekici()
            }
            
        }
    }
}


#Preview {
    ScreenPanelForUsers()
}
