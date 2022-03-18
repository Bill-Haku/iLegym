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
            RootView(hasLogined: $hasLogined)
                .offset(y: hasLogined ? 0 : 1.2 * WH.H)
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
