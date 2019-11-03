//
//  AppDelegate.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let contentView = AppView()

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }
}

