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
    let showSecondStep: Bool
    let openAuthentication, goBack: Call
    let authenticate: (String) -> Void

    var body: some View {
        Form {
            VStack(alignment: .center, spacing: .standardSpacing) {
                Text("􀑋􀌁")
                    .font(.largeTitle)
                    .foregroundColor(.appPrimary)
                Text("AppCenter")
                    .font(.headline)
                    .foregroundColor(.appPrimary)

                if showSecondStep {
                    TokenInputView(goBack: goBack, authenticate: authenticate)
                } else {
                    BrowserView(openAuthentication: openAuthentication)
                }
            }
        }
            .padding(.standardSpacing)
            .frame(minWidth: 450, idealWidth: 500, maxWidth: 550, minHeight: 200, idealHeight: 220, maxHeight: 240, alignment: .center)
    }
}

private struct BrowserView: View {
    let openAuthentication: Call

    var body: some View {
        VStack(alignment: .center, spacing: .standardSpacing) {
            Text("Open following address, login if needed and copy the API token:")
            Button(action: openAuthentication, label: { Text("Login using browser") })
        }
    }
}

private struct TokenInputView: View {
    let goBack: Call
    let authenticate: (String) -> Void

    @State private var token: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("API token", text: $token)
                StringPasteButton { self.token = $0 }
            }
            HStack {
                Button(
                    action: goBack,
                    label: ^Text("Go back")
                )
                Button(
                    action: ^self.authenticate(self.token),
                    label: ^Text("Authenticate")
                )
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            showSecondStep: false,
            openAuthentication: { print("Open authentication called") },
            goBack: { print("Go back called") },
            authenticate: { print($0) }
        )
    }
}
