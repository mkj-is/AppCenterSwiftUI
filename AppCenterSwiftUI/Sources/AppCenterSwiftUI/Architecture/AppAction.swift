import struct Foundation.URL

enum AppAction: Equatable {
    case appStarted
    case login(BasicAuthentication)
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
    case loadReleaseDetail(AppRelease)
    case releaseDetailLoaded(App, ReleaseDetail)
    case releaseDetailLoadingFailed(AppRelease, AppError)
    case open(url: URL)
}

struct AppError: Equatable {
    let error: Error

    static func == (lhs: AppError, rhs: AppError) -> Bool { true }
}
