//
//  RootView_macOS.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/4/5.
//

import Foundation
import SwiftUI

struct RootView: View {
    @State var selection: Int = 0
    @Binding var hasLogined: Bool
    @Binding var userInfo: UserLoginData?

    var body: some View {
        NavigationView {
            SideBarView(hasLogined: $hasLogined, userInfo: $userInfo)
            DailyActivitiesView()
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.leading")
                })
            }
        }
    }

    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
