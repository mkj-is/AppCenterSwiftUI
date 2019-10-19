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
    case .authenticate(let token):
        state.apiToken = token
    case .authenticated(let user):
        state.user = user
    case .authenticationFailed:
        state.apiToken = nil
        state.user = nil
    case .openAuthentication:
        state.loginBrowserOpened = true
    }
}
