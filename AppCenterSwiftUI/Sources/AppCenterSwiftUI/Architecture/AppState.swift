struct AppState {
    var loginBrowserOpened = false
    var apiToken: String?
    var user: User?
    var selectedApp: App?
    var apps: [App] = []
    var releases: [App: [Release]] = [:]
}
