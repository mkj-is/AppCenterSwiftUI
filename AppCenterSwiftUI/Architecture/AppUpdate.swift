//
//  AppUpdate.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 13/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import Foundation

func appUpdate(state: inout AppState, action: AppAction) {
    switch action {
    case .goBack:
        state.loginBrowserOpened = false
    case .update(let token):
        state.apiToken = token
    case .openAuthentication:
        state.loginBrowserOpened = true
    }
}
