//
//  LoginView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI
import Elementary

struct LoginView: View {
    let isLoading: Bool
    let authenticate: (BasicAuthentication) -> Void

    var body: some View {
        VStack(alignment: .center, spacing: .standardSpacing) {
            Symbol.appBadge
                .frame(maxWidth: 100, maxHeight: 100)
                .font(.largeTitle)
                .foregroundColor(.appPrimary)
            Text("App Center")
                .font(.headline)
                .foregroundColor(.appPrimary)

            if isLoading {
                LoadingView()
            } else {
                LoginFormView(authenticate: authenticate)
            }
        }
            .padding(.standardSpacing)
    }
}

private struct LoginFormView: View {
    let authenticate: (BasicAuthentication) -> Void

    @State private var user: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: .standardSpacing) {
            TextField("E-mail", text: $user)
            SecureField("Password", text: $password)
            Button(
                action: ^self.authenticate(BasicAuthentication(user: self.user, password: self.password)),
                label: ^Text("Log in")
            )
        }.frame(minWidth: 240, idealWidth: 350, maxWidth: 500, alignment: .center)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            isLoading: false,
            authenticate: noop
        )
    }
}
