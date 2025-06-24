//
//  SuperheroResponse.swift
//  SuperHero-IOS
//
//  Created by Tardes on 24/6/25.
//

import Foundation

struct SuperheroResponse: Codable {
     let results: [Superhero]
}

struct Superhero: Codable {
    let id: String
    let name: String
    let image: Image
}

struct Image: Codable {
    let url: String
}
