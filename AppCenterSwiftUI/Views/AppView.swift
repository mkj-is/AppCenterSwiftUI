//
//  ContentView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var store = ObservableStore<AppState, AppAction>(state: AppState(), update: appUpdate, effect: appEffect)

    var body: some View {
        LoginView(
            showSecondStep: store.state.loginBrowserOpened,
            openAuthentication: ^self.store.dispatch(.openAuthentication),
            goBack: ^self.store.dispatch(.goBack),
            authenticate: { self.store.dispatch(.update(token: $0))}
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
