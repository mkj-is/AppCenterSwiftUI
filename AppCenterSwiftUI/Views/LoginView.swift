//
//  LoginView.swift
//  AppCenterSwiftUI
//
//  Created by Matěj Kašpar Jirásek on 12/10/2019.
//  Copyright © 2019 FUNTASTY Digital s.r.o. All rights reserved.
//

import SwiftUI
import Elementary

private struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.foregroundColor(.appBlue)
    }
}

struct LoginView: View {
    let openAuthentication: Call
    let authenticate: (String) -> Void

    @State private var token: String = ""

    var body: some View {
        Form {
            VStack(alignment: .center, spacing: .standardSpacing) {
                Text("􀑋􀌁")
                    .font(.largeTitle)
                    .foregroundColor(.appPrimary)
                Text("Open following address, login if needed and copy the API token:")
                Button(action: openAuthentication, label: ^Text("Login using browser"))
                HStack {
                    TextField("API token", text: $token)
                    StringPasteButton { self.token = $0 }
                }
                Button(action: ^authenticate(token), label: ^Text("Authenticate"))
            }
        }.padding(.standardSpacing)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            openAuthentication: {},
            authenticate: { print($0) }
        )
    }
}
