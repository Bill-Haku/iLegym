//
//  RootView.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct RootView: View {
    @State var selection: Int = 0
    @Binding var hasLogined: Bool
    @Binding var userInfo: UserLoginData?
    var index: Binding<Int> { Binding(
        get: { self.selection },
        set: {
            if $0 != self.selection {
                simpleTaptic(type: .medium)
                print("taped here!!")
            }
            self.selection = $0
        }
    )}

    var body: some View {
        TabView (selection: index){
            DailyActivitiesView()
                .tag(0)
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("每日运动")
                }
            RunningView()
                .tag(1)
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("跑步")
                }
            SettingsView(hasLogined: $hasLogined, userInfo: $userInfo)
                .tag(2)
                .tabItem {
                    Image(systemName: "gear")
                    Text("设置")
                }
        }
    }
}
