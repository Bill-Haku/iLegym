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
            LoginView()
            if hasLogined {
                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
