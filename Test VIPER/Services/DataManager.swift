//
//  DataManager.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func getFavoriteState(key: String) -> Bool {
        UserDefaults().bool(forKey: key)
    }
    
    func setFavoriteState(value: Bool, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
}
