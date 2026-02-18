//
//  UserDefaultsService.swift
//  SOLID Principles
//
//  Created by Raja Musharraf on 18/02/2026.
//

import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService()
    private init() {}
    
    func save<T: Codable>(_ object: T?, forKey key: String) {
        guard let object = object else { return }
        if let data = try? JSONEncoder().encode(object) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func retrieve<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let object = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return object
    }
    
    func clear(keys: [String]) {
        keys.forEach { UserDefaults.standard.removeObject(forKey: $0) }
    }
    
    func set(_ value: Bool, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func bool(forKey key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    func set(_ value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func string(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }
    
    func set(_ date: Date, forKey key: String) {
        UserDefaults.standard.set(date, forKey: key)
    }
    
    func date(forKey key: String) -> Date? {
        return UserDefaults.standard.object(forKey: key) as? Date
    }
}
