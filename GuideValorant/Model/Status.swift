//
//  Status.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 16/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct Status: Decodable {
    let message: String?
    let statusCode: Int?
}
