import SwiftUI

struct AppListView: View {
    let apps: [App]

    var body: some View {
        List(apps) { app in
            VStack {
                HStack(alignment: .center, spacing: .standardSpacing) {
                    Text(app.displayName)
                    Spacer()
                    Text(app.os.rawValue)
                        .foregroundColor(.white)
                        .padding(.smallPadding)
                        .background(Capsule().foregroundColor(.secondary))
                }.padding(.standardPadding)
                Divider()
            }
        }
    }
}

struct AppListView_Previews: PreviewProvider {
    static var previews: some View {
        AppListView(apps: (0...40).map { _ in
            App(id: UUID(), description: nil, releaseType: nil, iconSource: nil, displayName: "ABC", name: "abc", os: .iOS, iconUrl: nil, owner: Owner(id: UUID(), avatarUrl: nil, name: "mkj", displayName: "Matěj Kašpar Jirásek", email: nil, type: .user), appSecret: "somesecret", azureSubscription: nil, platform: .apple, origin: .appcenter, memberPermissions: nil)
        })
    }
}
