//
//  ContentView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var store = ObservableStore<AppState, AppAction>(state: AppState(), update: appUpdate, effect: createAppEffect())

    var body: some View {
        ZStack {
            if store.state.user != nil {
                AppListView(apps: store.state.apps)
            } else {
                LoginView(
                    showSecondStep: store.state.loginBrowserOpened,
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
