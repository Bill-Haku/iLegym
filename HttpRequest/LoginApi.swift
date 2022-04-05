//
//  LoginApi.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import Foundation

extension API {
    struct Login {
        /// 用户登录
        /// - Parameters:
        ///   - username: 用户名
        ///   - password: 用户密码
        ///   - completion: UserLogInData的数据
        static func login (
            username: String,
            password: String,
            completion: @escaping (
                _ userLoginData: UserLoginData?,
                _ errorType: String?
            ) -> ()
        ) {
            // 请求类别
            let urlStr = "authorization/user/manage/login"
            // 请求体
            var httpBody = [String: Any]()
            httpBody.updateValue(username, forKey: "userName")
            httpBody.updateValue(password, forKey: "password")
            httpBody.updateValue(1, forKey: "entrance")
            // 请求
            HttpMethod<LoginData>
                .loginRequest(
                    .post,
                    urlStr,
                    httpBody
                ) { userLoginData, errorInfo in
                    // 异步返回相应数据
                    completion(userLoginData.data, errorInfo)
                }
        }
    }
}
