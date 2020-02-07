enum AppAction: Equatable {
    case appStarted
    case openAuthentication
    case goBack
    case authenticate(token: String)
    case authenticated(user: User)
    case authenticationFailed(AppError)
    case logout
    case loadApps
    case appsLoaded([App])
    case appsLoadingFailed(AppError)
    case appSelected(App)
    case releasesLoaded(App, [Release])
    case releasesLoadingFailed(App, AppError)
}

struct AppError: Equatable {
    let error: Error

    static func == (lhs: AppError, rhs: AppError) -> Bool { true }
}
