//
//  ActivityApi.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/18.
//

import Foundation

extension API {
    struct Activity {
        /// 获取活动列表
        /// - Parameters:
        ///   - username: 用户名
        ///   - password: 用户密码
        ///   - completion: UserLogInData的数据
        static func getActivityList (
            completion: @escaping (
                _ userLoginData: UserActivityListData?,
                _ errorType: String?
            ) -> ()
        ) {
            // 请求类别
            let urlStr = "education/app/activity/getActivityList"
            // 请求体
            var httpBody = [String: Any]()
            httpBody.updateValue("", forKey: "name")
            httpBody.updateValue("", forKey: "campus")
            httpBody.updateValue(1, forKey: "page")
            httpBody.updateValue(100, forKey: "size")
            httpBody.updateValue("", forKey: "state")
            httpBody.updateValue("", forKey: "topicId")
            httpBody.updateValue("", forKey: "week")

            // 请求
            HttpMethod<ActivityListData>
                .commonRequest(
                    .post,
                    urlStr,
                    httpBody
                ) { activityListData, errorType in
                    // 异步返回相应数据
                    completion(activityListData.data, errorType)
                }
        }
    }
}
