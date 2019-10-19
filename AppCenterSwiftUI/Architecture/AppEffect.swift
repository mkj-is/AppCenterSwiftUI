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
    return { state, action, dispatch in
        networkEffect(state, action, dispatch)

        if case .openAuthentication = action {
            NSWorkspace.shared.open(URL(string: "https://appcenter.ms/cli-login?hostname=AppCenter-macOS.local")!)
        }
    }
}
