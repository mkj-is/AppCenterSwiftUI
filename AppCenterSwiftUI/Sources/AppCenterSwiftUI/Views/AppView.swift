//
//  ContentView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

public struct AppView: View {
    @ObservedObject var store = ObservableStore<AppState, AppAction>(
        state: AppState(),
        update: appUpdate,
        effect: appEffect,
        initialAction: .appStarted
    )

    public init() {}

    public var body: some View {
        ZStack {
            if store.state.user != nil {
                DashboardView(
                    apps: store.state.apps,
                    selectedApp: store.state.selectedApp,
                    releases: store.state.selectedApp.flatMap { store.state.releases[$0] },
                    appSelected: { self.store.dispatch(.appSelected($0)) }
                )
            } else {
                LoginView(
                    showSecondStep: store.state.loginBrowserOpened,
                    isLoading: store.state.user == nil && store.state.apiToken != nil,
                    openAuthentication: ^self.store.dispatch(.openAuthentication),
                    goBack: ^self.store.dispatch(.goBack),
                    authenticate: { self.store.dispatch(.authenticate(token: $0))}
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
