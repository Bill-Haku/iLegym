//
//  SettingsView.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/3/17.
//

import SwiftUI

struct SettingsView: View {
    @Binding var hasLogined: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("设置")) {
                    Button(action: clearAllUserDefaultsData) {
                        Label("退出登录", systemImage: "arrow.left")
                    }
                }
            }
            .navigationTitle(UserDefaults.standard.string(forKey: "nickname") ?? "Uesrname_Error")
        }
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
