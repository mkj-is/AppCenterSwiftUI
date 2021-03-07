import struct Foundation.URL

enum AppAction: Equatable {
    case appStarted
    case select(LoginMethod?)
    case login(BasicAuthentication)
    case authenticate(token: String)
    case authenticated(user: User)
    case authenticationFailed(Equalized<Error>)
    case logout
    case loadApps
    case appsLoaded([App])
    case appsLoadingFailed(Equalized<Error>)
    case appSelected(App)
    case releasesLoaded(App, [Release])
    case releasesLoadingFailed(App, Equalized<Error>)
    case loadReleaseDetail(AppRelease)
    case downloadFailed(AppRelease, Equalized<Error>)
    case downloaded(AppRelease)
    case open(url: URL)
    case dismissError
    case retry
    case retried
}
