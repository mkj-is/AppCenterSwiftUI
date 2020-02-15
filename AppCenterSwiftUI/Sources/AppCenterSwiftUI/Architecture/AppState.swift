struct AppState {
    var auth: AppCenterAuthentication?
    var user: User?
    var selectedApp: App?
    var apps: [App] = []
    var releases: [App: [Release]] = [:]
    var downloadingReleases: Set<Release> = []
}
