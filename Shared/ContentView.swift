//
//  ContentView.swift
//  Shared
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

struct ContentView: View {
    @State var hasLogined = false

    var body: some View {
        ZStack  {
            #if os(iOS)
            LoginView(hasLogined: $hasLogined)
            if hasLogined {
                RootView()
                    .animation(.default)
                    .offset(y: (hasLogined && Device.deviceType == .iphone) ? 0 : 1.2 * WH.H)
            }
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
