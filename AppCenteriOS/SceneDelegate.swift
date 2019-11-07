//
//  SceneDelegate.swift
//  AppCenteriOS
//
//  Created by Matěj Kašpar Jirásek on 04/11/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import UIKit
import SwiftUI
import AppCenterSwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: AppView())
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
