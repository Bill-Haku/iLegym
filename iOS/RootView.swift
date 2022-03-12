//
//  RootView.swift
//  iLegym
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct RootView: View {
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
                    Text("每日运动")
                }
            RunningView()
                .tag(1)
                .tabItem {
                    Text("跑步")
                }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
