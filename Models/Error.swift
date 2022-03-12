//
//  Error.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import Foundation

struct ErrorCode: Codable {
    var code: Int
    var message: String
}

struct SessionCount: Codable {
    var body: CountSession
    struct CountSession: Codable {
        var count: Int
    }
}

struct UserCount: Codable {
    var total_num: Int
}
