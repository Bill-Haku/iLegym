//
//  iLegymApp.swift
//  Shared
//
//  Created by Bill Haku on 2022/3/12.
//

import SwiftUI

@main
struct iLegymApp: App {
    #if os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
