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
            Text("􀑋􀌁")
                .font(.largeTitle)
                .foregroundColor(.appPrimary)
            Text("AppCenter")
                .font(.headline)
                .foregroundColor(.appPrimary)

            if isLoading {
                LoadingView()
            } else {
                LoginFormView(authenticate: authenticate)
            }
        }
            .padding(.standardSpacing)
            .frame(minWidth: 450, idealWidth: 500, maxWidth: 550, minHeight: 200, idealHeight: 220, maxHeight: 240, alignment: .center)
    }
}

private struct LoginFormView: View {
    let authenticate: (BasicAuthentication) -> Void

    @State private var user: String = ""
    @State private var password: String = ""

    var body: some View {
        Form {
            Section {
                TextField("E-mail", text: $user)
            }
            Section {
                SecureField("Password", text: $password)
            }
            Section {
                Button(
                    action: ^self.authenticate(BasicAuthentication(user: self.user, password: self.password)),
                    label: ^Text("Log in")
                )
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            isLoading: false,
            authenticate: { print($0) }
        )
    }
}
