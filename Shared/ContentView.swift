//
//  ContentView.swift
//  Shared
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct ContentView: View {
    @State var hasLogined = false
    @State var userInfo: UserLoginData? = nil

    var body: some View {
        ZStack  {
            #if os(iOS)
            LoginView(hasLogined: $hasLogined, userInfo: $userInfo)
            RootView(hasLogined: $hasLogined, userInfo: $userInfo)
                .offset(y: hasLogined ? 0 : 1.2 * max(WH.H, WH.W))
                .animation(.default)
            #else
            LoginView()
            #endif
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
