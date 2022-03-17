//
//  ScreenWH.swift
//  iLegym (iOS)
//
//  Created by Bill Haku on 2022/3/13.
//

import Foundation
import UIKit

// Get Screen Width and Height dynamically
class WH {
    static var W = UIScreen.main.bounds.width
    static var H = UIScreen.main.bounds.height

    func refresh() {
        WH.W = UIScreen.main.bounds.width
        WH.H = UIScreen.main.bounds.height
    }
}
