//
//  File.swift
//  
//
//  Created by Matěj Kašpar Jirásek on 04/11/2019.
//

import Elementary
import ElementaryEffectBuilder

#if os(macOS)
import AppKit

func createUrlEffect(workspace: NSWorkspace = .shared) -> Effect<AppState, AppAction> {
    take(
        AppAction.openAuthentication,
        execute: { workspace.open(URL(string: "https://appcenter.ms/cli-login?hostname=AppCenter-macOS.local")!) }
    )
}

#else
import UIKit

func createUrlEffect(application: UIApplication = .shared) -> Effect<AppState, AppAction> {
    take(
        AppAction.openAuthentication,
        execute: { application.open(URL(string: "https://appcenter.ms/cli-login?hostname=AppCenter-macOS.local")!) }
    )
}
#endif
