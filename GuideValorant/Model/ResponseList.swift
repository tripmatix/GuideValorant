//
//  ResponseList.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 15/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct ResponseList: Decodable {
    let contentDto: ContentDto
    let error: ErrorResponse
}

struct ContentDto: Decodable {
    let version: String?
    let character: [Character]
    let maps: [Maps]
    let chromas: [Chromas]
    let skins: [Skins]
    let skinlevels: [SkinLevels]
    let equips: [Equips]
    let gameModes: [GameModes]
    let sprays: [Sprays]
    let sprayLevels: [SprayLevels]
    let charms: [Charms]
    let charmLevels: [CharmLevels]
    let playerCards: [PlayerCards]
    let playerTitles: [PlayerTitles]
}


struct Character: Decodable {
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

