struct AppState {
    var loginMethod: LoginMethod?
    var auth: AppCenterAuthentication?
    var user: User?
    var selectedApp: App?
    var apps: [App] = []
    var releases: [App: [Release]] = [:]
    var downloadingReleases: Set<AppRelease> = []
    var lastError: Error?
    var retryableAction: RetryableAction?
}

enum LoginMethod {
    case email, token
}
