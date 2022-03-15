//
//  NetworkManager.swift
//  Test VIPER
//
//  Created by Alik Nigay on 14.03.2022.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let api = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<[Course], NetworkError>) -> Void) {
        guard let url = URL(string: api) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let receivedData = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(receivedData))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    func fetchImage(url: String) -> Data? {
        guard let url = URL(string: url) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
