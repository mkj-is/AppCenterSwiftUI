import SwiftUI
import Elementary

struct UserView: View {
    let user: User
    let logout: Call

    var body: some View {
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
}

private struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User(id: UUID(), avatarUrl: nil, canChangePassword: true, displayName: "Matěj Kašpar Jirásek", email: "matej.jirasek@me.com", name: "matej.jirasek", origin: "appcenter", permissions: nil), logout: noop)
    }
}
