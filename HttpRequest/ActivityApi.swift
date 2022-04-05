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
        ///  - completion: 数据
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
                ) { activityListData, errorInfo in
                    // 异步返回相应数据
                    completion(activityListData.data, errorInfo)
                }
        }

        /// 打卡
        /// - Parameters:
        ///   - completion: 数据
        static func sign (
            userid: String,
            activityid: String,
            completion: @escaping (
                _ userLoginData: EmptyData?,
                _ errorType: String?
            ) -> ()
        ) {
            // 请求类别
            let urlStr = "education/activity/app/attainability/sign"
            // 请求体
            var httpBody = [String: Any]()
            httpBody.updateValue(userid, forKey: "userId")
            httpBody.updateValue(activityid, forKey: "activityId")
            httpBody.updateValue("activity", forKey: "pageType")
            httpBody.updateValue(2, forKey: "times")
            httpBody.updateValue(0, forKey: "activityType")
            httpBody.updateValue(2, forKey: "attainabilityType")

            // 请求
            HttpMethod<EmptyData>
                .commonRequest(
                    .put,
                    urlStr,
                    httpBody
                ) { responseData, errorType in
                    // 异步返回相应数据
                    completion(responseData, errorType)
                }
        }

        /// 报名
        /// - Parameters:
        ///   - completion: 数据
        static func signUp (
            activityid: String,
            completion: @escaping (
                _ userLoginData: UserActivitySignUpReturnData?,
                _ errorType: String?
            ) -> ()
        ) {
            // 请求类别
            let urlStr = "education/app/activity/signUp"
            // 请求体
            var httpBody = [String: Any]()
            httpBody.updateValue(activityid, forKey: "activityId")

            // 请求
            HttpMethod<ActivitySignUpReturnData>
                .commonRequest(
                    .post,
                    urlStr,
                    httpBody
                ) { responseData, errorInfo in
                    // 异步返回相应数据
                    completion(responseData.data, errorInfo)
                }
        }
    }
}
