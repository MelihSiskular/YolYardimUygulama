//
//  assdasd.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 30.04.2025.
//

import SwiftUI

struct assdasd: View {
    
    @State private var secilenTur : AracTuru = .otomobil
    @State private var secilenMarka : OtomobilMarka = .Alfa_Romeo
    @State private var secilenModelAlfa : AlfaModel = .Giulietta
    @State private var secilenModelAudi : AudiModel = .A1
    @State private var secilenModelBmw : BMWModel = .Z4
    @State private var secilenModelChevrolet : ChevroletModel = .Aveo


    var body: some View {
        ZStack {
            ScreenBackground()
            VStack {
                Picker("Kategori Seçin", selection: $secilenTur) {
                    ForEach(AracTuru.allCases) { aracturu in
                        Text(aracturu.displayName).tag(aracturu)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: secilenTur) { old,new in
                    print(secilenTur)
                }
                
                switch secilenTur {
                case .otomobil:
                    Picker("Marka", selection: $secilenMarka) {
                        ForEach(OtomobilMarka.allCases) { otoMarka in
                            Text(otoMarka.displayName).tag(otoMarka)
                        }
                    }
                    .pickerStyle(.menu)
                case .motor:
                    Picker("Marka", selection: $secilenMarka) {
                        ForEach(OtomobilMarka.allCases) { otoMarka in
                            Text(otoMarka.displayName).tag(otoMarka)
                        }
                    }
                    .pickerStyle(.menu)
                case .suv:
                    Picker("Marka", selection: $secilenMarka) {
                        ForEach(OtomobilMarka.allCases) { otoMarka in
                            Text(otoMarka.displayName).tag(otoMarka)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
             
              
                
                
                switch secilenMarka {
                case .Alfa_Romeo:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                    
                case .Audi:
                    Picker("Model Seçin", selection: $secilenModelAudi) {
                        
                        
                        ForEach(AudiModel.allCases) { secilenModelAudi in
                            Text(secilenModelAudi.displayName).tag(secilenModelAudi)
                        }
                    }
                case .BMW:
                    Picker("Model Seçin", selection: $secilenModelBmw) {
                        
                        
                        ForEach(BMWModel.allCases) { secilenModelBmw in
                            Text(secilenModelBmw.displayName).tag(secilenModelBmw)
                        }
                    }
                case .Chevrolet:
                    Picker("Model Seçin", selection: $secilenModelChevrolet) {
                        
                        
                        ForEach(ChevroletModel.allCases) { secilenModelChevrolet in
                            Text(secilenModelChevrolet.displayName).tag(secilenModelChevrolet)
                        }
                    }
                case .Citroen:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Cupra:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Dacia:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .DS_Automobiles:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Fiat:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Ford:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Honda:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Hyundai:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Kia:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Mazda:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Mercedes_Benz:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Mini:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Mitsubishi:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Nissan:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Opel:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Peugeot:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Porsche:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Renault:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Seat:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Skoda:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Subaru:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Suzuki:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Tesla:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Tofaş:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Toyota:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Volkswagen:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                case .Volvo:
                    Picker("Model Seçin", selection: $secilenModelAlfa) {
                        
                        
                        ForEach(AlfaModel.allCases) { secilenModelAlfa in
                            Text(secilenModelAlfa.displayName).tag(secilenModelAlfa)
                        }
                    }
                }
                   
                 
                }
                .pickerStyle(.menu)
                .onChange(of: secilenTur) { old,new in
                    print(secilenTur)
                    var asd = BMW(bmwModel: .Z4, otomarka: .BMW, arac: secilenTur, yil: 2000)
                }
            }
        }
    }


#Preview {
    assdasd()
}
