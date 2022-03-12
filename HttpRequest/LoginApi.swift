//
//  LoginApi.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import Foundation

extension API {
    struct login {
        /// 用户登录
        /// - Parameters:
        ///   - username: 用户名
        ///   - password: 用户密码
        ///   - completion: UserLogInData的数据
        static func logIn (
            username: String,
            password: String,
            completion: @escaping (
                _ userLoginData: UserLoginData?,
                _ errorType: String?
            ) -> ()
        ) {
            /// 请求类别
            let urlStr = "user/login"
            /// 请求体，通过String的拓展加参数
            let httpBody = ""
                .addPara("username", username)
                .addPara("password", password)
            /// 请求
            HttpMethod<UserLoginData>
                .loginRequest(
                    .post,
                    urlStr,
                    httpBody
                ) { userLoginData, errorType in
                    /// 异步返回相应数据
                    completion(userLoginData, errorType)
                }
        }
    }
}
