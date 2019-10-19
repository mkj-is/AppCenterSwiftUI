enum AppAction {
    case openAuthentication
    case goBack
    case authenticate(token: String)
    case authenticated(user: User)
    case authenticationFailed(Error)
    case loadApps
    case appsLoaded([App])
    case appsLoadingFailed(Error)
}
