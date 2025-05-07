//
//  YolYardimUygulamaProjeApp.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import ParseSwift

@main
struct YolYardimUygulamaProjeApp: App {
    
    init() {
        ParseSwift.initialize(
            applicationId: "HafPWbmr2YBRnCyjajWEHAZoOFV3Vi1x24CL7bS9",
            clientKey: "fR7627EvTxwHfTcipYwMnq0M89JwYbSMKQxjvdTv",
            serverURL: URL(string: "https://parseapi.back4app.com")!
            
        )
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
