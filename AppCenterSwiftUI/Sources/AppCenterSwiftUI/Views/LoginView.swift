import Elementary
import NoopKit
import SwiftUI

struct LoginView: View {
    let isLoading: Bool
    let loginMethod: LoginMethod?
    let select: (LoginMethod?) -> Void
    let authenticateToken: (String) -> Void
    let authenticateUser: (BasicAuthentication) -> Void

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
            } else if loginMethod == .token {
                TokenPasteView(authenticate: authenticateToken, goBack: ^self.select(nil))
            } else if loginMethod == .email {
                LoginFormView(authenticate: authenticateUser, goBack: ^self.select(nil))
            } else {
                LoginSelectionView(select: select)
            }
        }.padding(.standardSpacing)
    }
}

private struct LoginSelectionView: View {
    let select: (LoginMethod?) -> Void

    var body: some View {
        VStack(spacing: .standardSpacing) {
            Text("Login using e-mail and password is only available to account created on App Center.")
                .font(.footnote)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Button(action: ^self.select(.email), label: ^Text("Login using e-mail"))
            Button(action: ^self.select(.token), label: ^Text("Login using token"))
        }
    }
}

private struct TokenPasteView: View {
    let authenticate: (String) -> Void
    let goBack: Call

    @State private var token: String = ""

    var body: some View {
        VStack(spacing: .standardSpacing) {
            TextField("Token", text: $token)
            Button(
                action: ^self.authenticate(self.token),
                label: ^Text("Log in")
            )
            Button(
                action: goBack,
                label: ^Text("Go Back")
            )
        }
    }
}

private struct LoginFormView: View {
    let authenticate: (BasicAuthentication) -> Void
    let goBack: Call

    @State private var user: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: .standardSpacing) {
            TextField("E-mail", text: $user)
                .emailFieldIfAvailable()
            SecureField("Password", text: $password)
            Button(
                action: ^self.authenticate(BasicAuthentication(user: self.user, password: self.password)),
                label: ^Text("Log in")
            )
            Button(
                action: goBack,
                label: ^Text("Go Back")
            )
        }.frame(minWidth: 240, idealWidth: 350, maxWidth: 500, alignment: .center)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            isLoading: false,
            loginMethod: nil,
            select: noop,
            authenticateToken: noop,
            authenticateUser: noop
        )
    }
}
