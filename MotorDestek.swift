import Foundation


@State private var secilenModelArora: AroraModel? = nil
@State private var secilenModelBajaj: BajajModel? = nil
@State private var secilenModelCFmoto: CFmodel? = nil
@State private var secilenModelHondaMoto: HondaMotoModel? = nil
@State private var secilenModelKuba: KubaModel? = nil
@State private var secilenModelMondial: MondialModel? = nil
@State private var secilenModelRKS: RKSModel? = nil
@State private var secilenModelSYM: SYMModel? = nil
@State private var secilenModelTVS: TVSModel? = nil
@State private var secilenModelVespa: VespaModel? = nil
@State private var secilenModelYamaha: YamahaModel? = nil


switch secilenKategori{
    case .motor:
        enumPicker("Marka", selection: $secilenMarkaMotor)

        switch SecilenMarkaMotor{
            case .Arora:
                enumPicker("Model", selection: $secilenModelArora)
                    .onChange(of: secilenModelArora) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .Kuba:
                enumPicker("Model", selection: $secilenModelKuba)
                    .onChange(of: secilenModelKuba) { _, new in 
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawvalue
                        }
                    }
            case .Bajaj:
                enumPicker("Model", selection: $secilenModelBajaj)
                    .onChange(of: secilenModelBajaj) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .CFmotor:
                enumPicker("Model", selection: $secilenModelCFmoto)
                    .onChange(of: secilenModelCFmoto) { _, new in
                    secilenMarkaMotor = new
                        if let model = new {
                            selcilenModelMotor = model.rawValue
                        }
                    }
            case .HondaMoto:
                enumPicker("Model", selection: $secilenModelHondaMoto)
                    .onChange(of: secilenModelHondaMoto) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .Mondial:
                enumPicker("Model", selection: $secilenModelMondial)
                    .onChange(of: secilenModelMondial){ _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .RKS:
                enumPicker("Model", selection: $secilenModelRKS)
                    .onChange(of: secilenModelRKS) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .SYM:
                enumPicker("Model", selection: $secilenModelSYM)
                    .onChange(of: secilenModelSYM) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .TVS:
                enumPicker("Model", selection: $secilenModelTVS)
                    .onChange(of: secilenModelTVS) { _, new in
                    secilenMarkaMotor = new
                        if let model = new {
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .Vespa:
                enumPicker("Model", selection: $secilenModelVespa)
                    .onChange(of: secilenModelVespa) { _, new in
                    secilenMarkaMotor = new
                        if let model = new {
                            secilenModelMotor = model.rawValue
                        }
                    }
            case .Yamaha:
                enumPicker("Model", selection: $secilenModelYamaha)
                    .onChange(of: secilenModelYamaha) { _, new in
                    secilenMarkaMotor = new
                        if let model = new{
                            secilenModelMotor = model.rawValue
                        }
                    }
            }
            
}