//
//  ContentList.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 16/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct ContentList: Decodable {
    
    struct Characters: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Maps: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Chromas: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Skins: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct SkinLevels: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Equips: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct GameModes: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Sprays: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct SprayLevels: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct Charms: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct CharmLevels: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct PlayerCards: Decodable {
        let name: String?
        let assetName: String?
    }
    
    struct PlayerTitles: Decodable {
        let name: String?
        let assetName: String?
    }
    
    let characters: [Characters]
    let maps: [Maps]
    let chromas: [Chromas]
    let skins: [Skins]
    let skinLevels: [SkinLevels]
    let equips: [Equips]
    let gameModes: [GameModes]
    let sprays: [Sprays]
    let sprayLevels: [SprayLevels]
    let charms: [Charms]
    let charmLevels: [CharmLevels]
    let playerCards: [PlayerCards]
    let playerTitles: [PlayerTitles]
    let version: String?
    let status: Status?
}
