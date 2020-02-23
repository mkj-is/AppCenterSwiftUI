import struct Foundation.URL

enum AppAction: Equatable {
    case appStarted
    case login(BasicAuthentication)
    case authenticate(token: String)
    case authenticated(user: User)
    case authenticationFailed(EquatableError)
    case logout
    case loadApps
    case appsLoaded([App])
    case appsLoadingFailed(EquatableError)
    case appSelected(App)
    case releasesLoaded(App, [Release])
    case releasesLoadingFailed(App, EquatableError)
    case loadReleaseDetail(AppRelease)
    case downloadFailed(AppRelease, EquatableError)
    case downloaded(AppRelease)
    case open(url: URL)
    case dismissError
}

struct EquatableError: Equatable {
    let error: Error

    static func == (lhs: EquatableError, rhs: EquatableError) -> Bool { true }
}
