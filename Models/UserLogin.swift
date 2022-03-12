//
//  UserLogin.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import Foundation

struct UserLoginData: Codable {
    var id: String
    var uuasId: String?
    var organizationVerified: Int
    var identity: String
    var organizationId: String
    /// 学院
    var organizationName: String
    var schoolId: String
    var schoolName: String
    /// 学号
    var organizationUserNumber: String
    var nickName: String
    var realName: String
    var avatar: String?
    var gender: Int
    var birthDay: Int64
    var height: Int
    var weight: Int
    var faceId: String?
    var campusId: String
    var year: Int
    var accountNumber: String
    var mobile: String
    var authorities: [String]
    var accessToken: String
    var tokenType: String
    var refreshToken: String
    var userId: String?
    var semesterId: String?
    var campusName: String?
    var accessTokenExpires: String
}
