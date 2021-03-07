import Elementary
import NoopKit
import SwiftUI

#if os(iOS) || os(tvOS)
struct UserView: View {
    let user: User
    let logout, close: Call

    var body: some View {
        NavigationView {
            VStack {
                WebImage(placeholder: Symbol.account.foregroundColor(Color.appPrimary), url: user.avatarUrl)
                    .frame(maxWidth: 100, maxHeight: 100)
                    .clipShape(Circle())
                    .padding()
                Form {
                    Section {
                        Text(user.displayName)
                        Text(user.email)
                    }
                    Section {
                        Button(action: logout, label: ^Text("Logout"))
                    }
                }
            }
            .backgroundColorIfAvailable()
            .navigationBarTitleIfAvailable("Account")
            .navigationBarItems(trailing: Button(action: self.close, label: ^Symbol.close))
        }
            .navigationViewStyle(StackNavigationViewStyle())
            .accentColor(.appPrimary)
    }
}

private struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(
            id: UUID(),
            avatarUrl: nil,
            canChangePassword: true,
            displayName: "Matěj Kašpar Jirásek",
            email: "matej.jirasek@me.com",
            name: "matej.jirasek",
            origin: "appcenter",
            permissions: nil
        ), logout: noop, close: noop)
    }
}
#endif
