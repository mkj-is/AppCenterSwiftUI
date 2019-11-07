//
//  AppEffect.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 13/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import Foundation
import Elementary
import ElementaryEffectBuilder

let appEffect: Effect<AppState, AppAction> = build {
    createNetworkEffect()
    createPersistenceEffect()
    createUrlEffect()
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
