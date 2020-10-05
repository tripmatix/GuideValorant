//
//  ErrorResponse.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 15/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import Foundation

struct ErrorResponse: Decodable {
    let error: String?
    let reason: String?
}
