import SwiftUI

struct AppListView: View {
    let apps: [App]
    let selectedApp: App?
    let releases: [App: [Release]]
    let downloadingReleases: Set<AppRelease>
    let appSelected: (App) -> Void
    let download: (AppRelease) -> Void

    var body: some View {
        List(apps) { app in
            System(.macOS, content:
                ^Button(action: ^self.appSelected(app), label: ^AppDisclosureView(app: app))
                    .buttonStyle(PlainButtonStyle())
            )
            System(.iOS, content:
                ^NavigationLink(
                    destination: ReleaseListView(app: app, releases: self.releases[app] ?? [], downloadingReleases: self.downloadingReleases, download: self.download).onAppear(perform: ^self.appSelected(app)),
                    label: ^AppDisclosureView(app: app)))
        }
        .sidebarListStyleIfAvailable()
        .frame(minWidth: 200, idealWidth: 250, maxWidth: 400, minHeight: 300, idealHeight: 400)
    }
}

struct AppListView_Previews: PreviewProvider {
    static var previews: some View {
        let apps = (0...40).map { _ in
            App(id: UUID(), description: nil, releaseType: nil, iconSource: nil, displayName: "ABC", name: "abc", os: .iOS, iconUrl: nil, owner: Owner(id: UUID(), avatarUrl: nil, name: "mkj", displayName: "Matěj Kašpar Jirásek", email: nil, type: .user), appSecret: "somesecret", azureSubscription: nil, platform: .apple, origin: .appcenter, createdAt: Date(), updatedAt: Date(), memberPermissions: nil)
        }
        return AppListView(apps: apps, selectedApp: apps.first, releases: [:], downloadingReleases: [], appSelected: noop, download: noop)
    }
}
