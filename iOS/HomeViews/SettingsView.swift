//
//  SettingsView.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/3/17.
//

import SwiftUI

struct SettingsView: View {
    @Binding var hasLogined: Bool
    @Binding var userInfo: UserLoginData?

    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    let buildVersion = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("个人信息")) {
                    HStack {
                        Text("昵称")
                        Spacer()
                        Text(userInfo?.nickName ?? "")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("真实姓名")
                        Spacer()
                        Text(userInfo?.realName ?? "")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("学校")
                        Spacer()
                        Text(userInfo?.schoolName ?? "")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("学院")
                        Spacer()
                        Text(userInfo?.organizationName ?? "")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("年级")
                        Spacer()
                        Text("\(userInfo?.year ?? 0)")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("身高")
                        Spacer()
                        Text("\(userInfo?.height ?? 0)")
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("体重")
                        Spacer()
                        Text("\(userInfo?.weight ?? 0)")
                    }
                    .padding(.horizontal)
                }
                Section(header: Text("设置"), footer: Text("App版本：\(appVersion) (\(buildVersion))\n本程序仅作学习用途，使用后果自负。")) {
                    Button(action: clearAllUserDefaultsData) {
                        Label("退出登录", systemImage: "arrow.left")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        if userInfo?.avatar != nil {
                            AsyncImage(url: URL(string: userInfo?.avatar ?? ""))
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle")
//                                .resizable()
                                .clipShape(Circle())
                        }

                        Text(userInfo?.nickName ?? "Nickname Nil")
                            .bold()
                            .font(.headline)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }

    func clearAllUserDefaultsData() {
        let userDefaults = UserDefaults.standard
        let dics = userDefaults.dictionaryRepresentation()
        for key in dics {
            userDefaults.removeObject(forKey: key.key)
        }
        userDefaults.synchronize()

        hasLogined = false
    }
}
