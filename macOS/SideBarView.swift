//
//  SideBarView.swift
//  iLegym (macOS)
//
//  Created by Bill Haku on 2022/4/5.
//

import SwiftUI

struct SideBarView: View {
    @Binding var hasLogined: Bool
    @Binding var userInfo: UserLoginData?
    
    var body: some View {
        List {
            NavigationLink(destination: DailyActivitiesView()) {
                Label("每日活动", systemImage: "sportscourt")
            }
            NavigationLink(destination: RunningView()) {
                Label("跑步", systemImage: "figure.walk")
            }
            NavigationLink(destination: SettingsView(hasLogined: $hasLogined, userInfo: $userInfo)) {
                Label("我的", systemImage: "person.crop.circle")
            }
        }
        .listStyle(.sidebar)    }
}
