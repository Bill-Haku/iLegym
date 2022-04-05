//
//  AppDelegate.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/4/5.
//

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
