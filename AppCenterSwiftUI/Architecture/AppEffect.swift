//
//  AppEffect.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 13/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import AppKit
import Elementary

func appEffect(
    state: () -> AppState,
    action: AppAction,
    dispatch: @escaping Dispatch<AppAction>
) {
    if case .openAuthentication = action {
        NSWorkspace.shared.open(URL(string: "https://appcenter.ms/cli-login?hostname=AppCenter-macOS.local")!)
    }
}
