//
//  ScreenUserProposals.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 18.04.2025.
//

import SwiftUI
import MapKit
class OnayliVasitaViewModel: ObservableObject {

    @Published var liste: [OnayliVasita] = []
    
    func fetch(for email: String) {
        print(email)
        print("çekme işlemi")
        let query = OnayliVasita.query()
            .include("kullanici")
            .include("onaylayan")
        
        query.find { result in
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.liste = items.filter { $0.emailKullanici == email }
                }
            case .failure(let error):
                print("Veri çekme hatası: \(error)")
            }
        }
    }
}

struct ScreenUserProposals: View {
    @Binding var badgeList : Int
    @StateObject private var viewModel = OnayliVasitaViewModel()
    @State var userEmail = User.current?.email
    @State private var mesafeler: [String: String] = [:]
    @State private var tahminiSureler: [String: String] = [:]

    var body: some View {
        ZStack {
            ScreenBackground()
            ScrollView {
                Text("Onaylanan Teklifler")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .shadow(radius: 1)
                    .padding(.top,20)
                
                Divider().background(Color.white.opacity(0.1))
                    .padding(.horizontal)

                VStack(spacing: 12) {
                    ForEach(viewModel.liste, id: \.objectId) { item in
                        VStack(alignment: .leading, spacing: 6) {
                            Label("Dükkan: \(item.nameAdmin ?? "-")", systemImage: "person.fill")
                                .font(.title2)
                            Label("Te No: \(item.phoneAdmin ?? "-")", systemImage: "phone.fill")
                            Text(Image(systemName: "location.fill")) + Text(" Uzaklık:\(mesafeler[item.objectId ?? ""] ?? "- km")")
                            Text(Image(systemName: "clock")) + Text("  Tahmini Varış Süresi: \(tahminiSureler[item.objectId ?? ""] ?? "- dk")")


                            
                        }
                        .frame(maxWidth:.infinity)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        )
                        .onAppear {
                            if let id = item.objectId, mesafeler[id] == nil || tahminiSureler[id] == nil {
                                getDistanceAndTime(item: item) { distance, time in
                                    DispatchQueue.main.async {
                                        mesafeler[id] = distance
                                        tahminiSureler[id] = time
                                    }
                                }
                            }
                        }

                        
                    }
                    
                }
                .padding()
            }
            .onAppear {
                if let currentEmail = User.current?.email {
                    viewModel.fetch(for: currentEmail)
                    badgeList = viewModel.liste.count
                    }
             
            }
        }
    }
    
    func getDistanceAndTime(item: OnayliVasita, completion: @escaping (String, String) -> Void) {
        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: item.latitudeAnlik ?? 0.0, longitude: item.longituteAnlik ?? 0.0)))
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: item.latitudeAdmin ?? 0.0, longitude:  item.longituteAdmin ?? 0.0)))
        
        let request = MKDirections.Request()
        request.source = source
        request.destination = destination
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                let distance = String(format: "%.1f km", route.distance / 1000)
                let duration = Int(route.expectedTravelTime / 60)
                let timeText = "\(duration) dk içinde varılır"
                completion(distance, timeText)
            } else {
                completion("- km", "- dk")
            }
        }
    }



}


#Preview {
    ScreenUserProposals(badgeList: .constant(1))
}
