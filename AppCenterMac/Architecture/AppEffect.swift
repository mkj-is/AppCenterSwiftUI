//
//  AppEffect.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 13/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import AppKit
import Elementary

func createAppEffect() -> Effect<AppState, AppAction> {
    let networkEffect = createNetworkEffect()
    let persistenceEffect = createPersistenceEffect()
    return { state, action, dispatch in
        persistenceEffect(state, action, dispatch)
        networkEffect(state, action, dispatch)


        switch action {
        case .openAuthentication:
            NSWorkspace.shared.open(URL(string: "https://appcenter.ms/cli-login?hostname=AppCenter-macOS.local")!)
        default:
            break
        }
    }
}

private func createPersistenceEffect(defaults: UserDefaults = .standard) -> Effect<AppState, AppAction> {
    let tokenKey = "tokenKey"
    return { state, action, dispatch in
        switch action {
        case .appStarted:
            defaults.string(forKey: tokenKey).flatMap { dispatch(.authenticate(token: $0)) }
        case .authenticate(let token):
            defaults.set(token, forKey: tokenKey)
        default:
            break
        }
    }
}
