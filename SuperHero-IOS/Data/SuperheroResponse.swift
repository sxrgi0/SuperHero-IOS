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
    let powerstats: Powerstats
    let biography: Biography
}

struct Image: Codable {
    let url: String
}

struct Powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct Biography: Codable {
    let realName: String
    let placeOfBirth: String
    let publisher: String
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case realName = "full-name"
        case placeOfBirth = "place-of-birth"
        case publisher, alignment
    }
}
