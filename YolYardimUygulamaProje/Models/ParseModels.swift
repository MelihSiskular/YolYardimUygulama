//
//  ParseModels.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 7.05.2025.
//

import Foundation
import ParseSwift

struct User:ParseUser {
    var updatedAt: Date?
    
    var username: String?
    
    var email: String?
    
    var emailVerified: Bool?
    
    var password: String?
    
    var authData: [String : [String : String]?]?
    
    var originalData: Data?
    
    var objectId: String?
    
    var createdAt: Date?
    
   
    
    var ACL: ParseSwift.ParseACL?
    
    var detail : String?
    var fullName: String?
    var phone: String?
    var isAdmin: Bool?
    
    var latitudeAdmin : Double?
    var longituteAdmin : Double?

}

struct VasitaParseCekici: ParseObject {
    var originalData: Data?
    
    // Zorunlu Parse alanları
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    
    // Araç bilgileri
    var kullanici: User?
    var emailKullanici: String?
    var fullName : String?
    var Kategori: String?
    var marka: String?
    var model: String?
    var yil: String?
    var longituteHedef: Double?
    var latitudeHedef: Double?
    var longituteAnlik: Double?
    var latitudeAnlik: Double?
}

struct VasitaParseLastik: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var kullanici: User?
    var emailKullanici: String?
    var fullName: String?
    var kategori: String?
    var altKategori: String?
    var marka: String?
    var model: String?
    var yil: String?
    var genislik: String?
    var oran: String?
    var cap: String?
    var mevsim: String?
    var longituteAnlik: Double?
    var latitudeAnlik: Double?
    
    
}

struct OnayliLastik: ParseObject {
    var originalData: Data?
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseSwift.ParseACL?
    
    var kullanici: User?
    var onaylayanAdmin: User?
    //Adminden Gelenler
    var longituteAdmin: Double?
    var latitudeAdmin: Double?
    var nameAdmin: String?
    var phoneAdmin: String?
    //Kullanıcıdan gelenler
    var longituteAnlik: Double?
    var latitudeAnlik: Double?
    var emailKullanici: String?

}

struct OnayliVasita: ParseObject {
    // Gerekli Parse alanları
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    // Kullanıcı ve admin bilgisi
    var kullanici: User?              // Bu aracı ekleyen kullanıcı
    var onaylayanAdmin: User?        // Onaylayan admin kullanıcı
    //Adminden gelenler
    var longituteAdmin: Double?
    var latitudeAdmin: Double?
    var nameAdmin: String?
    var phoneAdmin: String?
    // Kullanıcıdan gelenler
    var emailKullanici: String?
    var longituteHedef: Double?
    var latitudeHedef: Double?
    var longituteAnlik: Double?
    var latitudeAnlik: Double?
}





