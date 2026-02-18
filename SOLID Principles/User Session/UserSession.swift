//
//  UserSession.swift
//  SOLID Principles
//
//  Created by Raja Musharraf on 18/02/2026.
//
import UIKit

class UserSession {
    static let shared = UserSession()
    private init() {}
    
    var loginUserModel: LoginResponseModel?
    var fcmToken: String?
    
    // Session management
    func setUserLoginModel(model: LoginResponseModel?) {
        loginUserModel = model
        UserDefaultsService.shared.save(model, forKey: "savedUser")
    }
    
    func loadUserLoginModel() {
        loginUserModel = UserDefaultsService.shared.retrieve(LoginResponseModel.self, forKey: "savedUser")
    }
    
    func clearCache() {
        print("Cache Cleared")
    }
}
