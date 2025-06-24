//
//  SuperheroProvider.swift
//  SuperHero-IOS
//
//  Created by Tardes on 24/6/25.
//

import Foundation

class SuperheroProvider {
    
    static let BASE_URL = "https://superheroapi.com/api/"
    static let ACCESS_TOKEN = "61792526c8ce513fd45a01c8b2d89e3f"
    
    static func findSuperheroes(query: String) async -> [Superhero] {
        
        guard let url = URL(string: "\(BASE_URL)/\(ACCESS_TOKEN)/search/\(query)") else {
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            /*if let str = String(data: data, encoding: .utf8) {
                print("Succesfully decoded: \(str)")
            }*/
            
            return try JSONDecoder().decode(SuperheroResponse.self, from: data).results
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
