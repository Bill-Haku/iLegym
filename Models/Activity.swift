//
//  Activity.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/18.
//

import Foundation

struct ActivityListData: Codable {
    var code: Int
    var message: String?
    var data: UserActivityListData?
}

struct ActivitySignUpReturnData: Codable {
    var code: Int
    var message: String?
    var data: UserActivitySignUpReturnData?
}

struct UserActivityListData: Codable {
    var pageNum: Int
    var pageSize: Int
    var total: Int
    var items: [ItemUnit]

    struct ItemUnit: Codable, Hashable, Identifiable {
        var id: String
        var name: String
        /// 当前状态值
        /// - 0: 报名未开始
        /// - 1: 报名进行中
        /// - 4: 活动进行中
        var state: Int
        var stateName: String
        var address: String
        var bgUrl: String?
        var limitPeopleNumber: Int
        var registerPeople: Int
        var isRegister: Bool
        var isSign: Bool?
        var signType: Int?
        var signTime: Int?
        var performSignType: Int?
        var openSignTimes: Int?
        var performTime: Int?
    }
}

struct UserActivitySignUpReturnData: Codable {
    var success: Bool
    var reason: String?
}
