//
//  MacApp.swift
//  AppKitGlue
//
//  Created by Takahiko Inayama on 2020/07/04.
//

import Foundation
import Cocoa

class DockController: NSObject, DockInterface {
    func updateBadge(_ text: String) {
        let dock = NSApp.dockTile
        dock.badgeLabel = text
    }

}
