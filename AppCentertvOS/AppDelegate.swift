//
//  AppDelegate.swift
//  AppCentertvOS
//
//  Created by Matěj Kašpar Jirásek on 20/02/2020.
//  Copyright © 2020 FUNTASTY Digital s.r.o. All rights reserved.
//

import UIKit
import SwiftUI
import AppCenterSwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let contentView = AppView()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

