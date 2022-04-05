//
//  LoginView.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI
import UIKit

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct LoginView: View {
    @State var userName = ""
    @State var userPassword = ""
    @Binding var hasLogined: Bool
    @Binding var userInfo: UserLoginData?
    @State var isShowAlert: Bool = false
    @State var alertConetent: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("登录 iLegym")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 10, trailing: 10))
                    .foregroundColor(.blue)
                Spacer().frame(width: 100, height: 80)

                VStack {
                    Text("账号")
                        .font(.callout)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("您的乐健账号", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.username)
                    Spacer()
                        .frame(width: 100, height: 16, alignment: .center)
                    Text("密码")
                        .font(.callout)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    SecureField("输入您的密码", text: $userPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)

                }.padding()
                Spacer().frame(width: 100, height: 60)

                Button(action: {
                    API.Login.login(username: userName, password: userPassword) { loginData, errorInfo in
                        if errorInfo != nil {
                            isShowAlert = true
                            alertConetent = errorInfo!
                        }
                        if loginData != nil {
                            UserDefaults.standard.setValue(loginData!.accessToken, forKey: "token")
                            UserDefaults.standard.setValue(userName, forKey: "username")
                            UserDefaults.standard.setValue(userPassword, forKey: "password")
                            UserDefaults.standard.setValue(loginData!.nickName, forKey: "nickname")
                            UserDefaults.standard.setValue(loginData!.id, forKey: "id")
                            print("token: \(loginData!.accessToken)")
                            hasLogined = true
                            userInfo = loginData
                        }
                    }
                }) {
                    Text("登录")
                        .fontWeight(.bold)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height) - 32, height: 44, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(22)
                }

                Spacer()
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text("登录失败"), message: Text(alertConetent), dismissButton: .default(Text("好")))
            }
            .onAppear() {
                let defaultUserName = UserDefaults.standard.string(forKey: "username")
                let defaultPassword = UserDefaults.standard.string(forKey: "password")
                guard defaultPassword != nil, defaultUserName != nil else {
                    return
                }
                API.Login.login(username: defaultUserName!, password: defaultPassword!) { loginData, errorInfo in
                    if errorInfo != nil {
                        isShowAlert = true
                        alertConetent = errorInfo!
                    }
                    if loginData != nil {
                        UserDefaults.standard.setValue(loginData!.accessToken, forKey: "token")
                        UserDefaults.standard.setValue(loginData!.nickName, forKey: "nickname")
                        UserDefaults.standard.setValue(loginData!.id, forKey: "id")
                        print("token: \(loginData!.accessToken)")
                        hasLogined = true
                        userInfo = loginData
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

